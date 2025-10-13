module Restador1Bit (
    input  wire A,      // Minuendo
    input  wire B,      // Sustraendo
    input  wire Bi,    // Préstamo de entrada (Borrow in)
    output wire D,      // Diferencia
    output wire Bo    // Préstamo de salida (Borrow out)
);

    // Diferencia: XOR entre A, B y Bin
    assign D = A ^ B ^ Bi;

    // Cálculo del préstamo de salida
    assign Bo = (~A & B) | (B & Bi) | (~A & Bi);

endmodule
