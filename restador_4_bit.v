`include "restador_1_bit.v"

module res4b (
    input [3:0] A,
    input [3:0] B,
    input Bi,
    output [3:0] D, 
    output  Bo
);

wire B0;
wire B1;
wire B2;

Restador1Bit bit0(.A(A[0]), .B(B[0]), .Bi(1'b0), .D(D[0]), .Bo(B0));
Restador1Bit bit1(.A(A[1]), .B(B[1]), .Bi(B0), .D(D[1]), .Bo(B1));
Restador1Bit bit2(.A(A[2]), .B(B[2]), .Bi(B1), .D(D[2]), .Bo(B2));
Restador1Bit bit3(.A(A[3]), .B(B[3]), .Bi(B2), .D(D[3]), .Bo(Bo));
    
endmodule