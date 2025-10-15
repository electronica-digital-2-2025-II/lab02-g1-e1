//====================================================
// TESTBENCH - ALU 4 bits (5 operaciones) - corregido
//====================================================
`timescale 1ns/1ps
`include "ALU.V"

module tb_ALU_4bit;
    reg  [3:0] A, B;
    reg  [2:0] SEL;
    reg        clk, rst, init;
    wire [7:0] Y;
    wire       done;

    ALU_4bit DUT (
        .A(A), .B(B), .SEL(SEL),
        .clk(clk), .rst(rst), .init(init),
        .Y(Y), .done(done)
    );

    // Generar reloj
    always #5 clk = ~clk;

    initial begin
        $dumpfile("ALU_4bit.vcd");
        $dumpvars(0, tb_ALU_4bit);
    end

    initial begin
        // Inicialización
        clk = 0; rst = 1; init = 0; A = 4'd0; B = 4'd0; SEL = 3'b000;
        #10 rst = 0;

        // ---------------- Suma ----------------
        A = 4'd5; B = 4'd3; SEL = 3'b000; #20;

        // ---------------- Resta ----------------
        A = 4'd9; B = 4'd4; SEL = 3'b001; #20;

        // ---------------- Multiplicación ----------------
        A = 4'd3; B = 4'd2; SEL = 3'b010; init = 1; #10; init = 0;
        wait (done == 1); #20;  // espera a que termine el FSM

        // ---------------- AND ----------------
        A = 4'b1101; B = 4'b1010; SEL = 3'b011; #20;

        // ---------------- Corrimiento a la derecha ----------------
        A = 4'b1101; B = 4'd2; SEL = 3'b100; #20;

        $finish;
    end
endmodule
