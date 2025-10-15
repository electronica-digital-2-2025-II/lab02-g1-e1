//====================================================
// Corrimiento lógico a la derecha de 4 bits
//====================================================
module shift_right_4bit (
    input  [3:0] A,          // Datos de entrada
    input  [2:0] shift,      // Número de posiciones a desplazar (0-4)
    output reg [3:0] Y       // Resultado desplazado
);
    always @(*) begin
        case (shift)
            3'd0: Y = A;             // Sin desplazamiento
            3'd1: Y = {1'b0, A[3:1]};
            3'd2: Y = {2'b00, A[3:2]};
            3'd3: Y = {3'b000, A[3]};
            3'd4: Y = 4'b0000;       // Todo se pierde al correrse 4
            default: Y = 4'b0000;
        endcase
    end
endmodule
