module sumador_1bit (
    input  wire A,      // Primer bit de entrada
    input  wire B,      // Segundo bit de entrada
    input  wire Ci,    // Acarreo de entrada
    output wire S,      // Suma
    output wire Co    // Acarreo de salida
);

    assign S    = A ^ B ^ Ci;                   // XOR para la suma
    assign Co = (A & B) | (A & Ci) | (B & Ci); // Lógica del acarreo

endmodule
