//====================================================
// ALU 4 bits con 5 operaciones (corregido)
//====================================================

`include "restador_4_bit.v"
`include "sumador_4_bit.v"
`include "multi.v"
`include "AND.V"
`include "SHIFT.V"

module ALU_4bit (
    input  [3:0] A, B,        // Entradas de 4 bits
    input  [2:0] SEL,         // Selector de operación (3 bits)
    input        clk, rst, init, // Señales para multiplicador FSM
    output reg [7:0] Y,       // Salida 8 bits
    output       done         // Bandera fin multiplicación
);

    // Señales internas
    wire [4:0] SUMA;          // 5 bits (carry)
    wire [4:0] RESTA;         // 5 bits (borrow)
    wire [5:0] MULT;          // 6 bits (producto del FSM) <-- CORREGIDO
    wire [3:0] AND_OUT;       // Resultado AND
    wire [3:0] SHIFT_OUT;     // Resultado desplazamiento
    wire       done_mult;

    // Instanciaciones
    sum4b U1 (
        .A(A),
        .B(B),
        .S(SUMA[3:0]),
        .Co(SUMA[4])
    );

    res4b U2 (
        .A(A),
        .B(B),
        .D(RESTA[3:0]),
        .Bo(RESTA[4])
    );

    multiplicador_3bit_fsm U3 (
        .clk(clk),
        .rst(rst),
        .init(init),
        .A(A[2:0]),
        .B(B[2:0]),
        .P(MULT),    // MULT es [5:0], coincide con P[5:0]
        .done(done_mult)
    );

    and_4bit U4 (
        .A(A),
        .B(B),
        .Y(AND_OUT)
    );

    shift_right_4bit U5 (
        .A(A),
        .shift(B[2:0]),
        .Y(SHIFT_OUT)
    );

    assign done = done_mult;

    // Multiplexor de selección de operación (extiendo MULT a 8 bits)
    always @(*) begin
        case (SEL)
            3'b000: Y = {3'b000, SUMA};          // Suma
            3'b001: Y = {3'b000, RESTA};         // Resta
            3'b010: Y = {2'b00, MULT};           // Multiplicación (6->8 bits)
            3'b011: Y = {4'b0000, AND_OUT};      // AND
            3'b100: Y = {4'b0000, SHIFT_OUT};    // Corrimiento derecha
            default: Y = 8'b00000000;
        endcase
    end

endmodule
