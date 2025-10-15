module multiplicador_3bit_fsm (
    input  wire       clk,
    input  wire       rst,     // reset síncrono
    input  wire       init,    // iniciar multiplicación
    input  wire [2:0] A,       // multiplicando
    input  wire [2:0] B,       // multiplicador
    output reg  [5:0] P,       // producto
    output reg        done     // bandera de fin
);

    // ==================================================
    // 1. Estados (en Verilog clásico)
    // ==================================================
    localparam START  = 3'b000,
               CHECK  = 3'b001,
               ADD    = 3'b010,
               SHIFT  = 3'b011,
               END_S  = 3'b100;

    reg [2:0] state;
    reg [2:0] next_state;

    // ==================================================
    // 2. Registros internos
    // ==================================================
    reg [2:0] regA;      // multiplicando
    reg [2:0] regB;      // multiplicador
    reg [5:0] acc;       // acumulador parcial (producto)
    reg [2:0] count;     // contador de ciclos

    // ==================================================
    // 3. Registro de estado
    // ==================================================
    always @(posedge clk) begin
        if (rst)
            state <= START;
        else
            state <= next_state;
    end

    // ==================================================
    // 4. Lógica de transición de estados
    // ==================================================
    always @(*) begin
        case (state)
            START: begin
                if (init)
                    next_state = CHECK;
                else
                    next_state = START;
            end

            CHECK: begin
                if (regB[0]) // LSB_B = 1
                    next_state = ADD;
                else
                    next_state = SHIFT;
            end

            ADD: next_state = SHIFT;

            SHIFT: begin
                if (count == 3) // ya procesó 3 bits
                    next_state = END_S;
                else
                    next_state = CHECK;
            end

            END_S: next_state = START;

            default: next_state = START;
        endcase
    end

    // ==================================================
    // 5. Operaciones de datos (sincrónicas)
    // ==================================================
    always @(posedge clk) begin
        if (rst) begin
            regA  <= 0;
            regB  <= 0;
            acc   <= 0;
            count <= 0;
            P     <= 0;
            done  <= 0;
        end else begin
            case (state)
                START: begin
                    done <= 0;
                    if (init) begin
                        regA  <= A;
                        regB  <= B;
                        acc   <= 0;
                        count <= 0;
                    end
                end

                CHECK: begin
                    // no hace nada, solo evalúa siguiente estado
                end

                ADD: begin
                    acc <= acc + (regA << count); // suma parcial
                end

                SHIFT: begin
                    regB  <= regB >> 1;  // desplazamos B
                    count <= count + 1;  // incrementamos contador
                end

                END_S: begin
                    P    <= acc;
                    done <= 1;
                end
            endcase
        end
    end

endmodule
