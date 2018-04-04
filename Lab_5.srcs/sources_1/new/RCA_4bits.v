`timescale 1ns / 1ps

module RCA_4bits(
        input clk,
        input enable,
        input [3:0] A, B,
        input Cin,
        output [4:0] Q
    );
    
    wire c1, c2, c3;
    full_adder  FA1 (A[0], B[0], Cin, Q[0], c1),
                FA2 (A[1], B[1], c1, Q[1], c2),
                FA3 (A[2], B[2], c2, Q[2], c3),
                FA4 (A[3], B[3], c3, Q[3], Q[4]);
    
    register_logic r1(.clk(clk), .enable(enable), .Q(Q));
endmodule