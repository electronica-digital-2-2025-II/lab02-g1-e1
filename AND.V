//====================================================
// Compuerta lógica AND de 4 bits
//====================================================
module and_4bit (
    input  wire [3:0] A,    // Entrada A (4 bits)
    input  wire [3:0] B,    // Entrada B (4 bits)
    output wire [3:0] Y     // Salida = A AND B (4 bits)
);
    assign Y = A & B;       // Operación AND bit a bit
endmodule
