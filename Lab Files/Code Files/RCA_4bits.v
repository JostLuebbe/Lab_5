`timescale 1ns / 1ps

module RCA_4bits(
        input clk,
        input enable,
        input [3:0] A, B,
        input Cin,
        output [4:0] Q
    );
    
    wire c1, c2, c3;
    wire [4:0] Data;
    
    full_adder  FA1 (A[0], B[0], Cin, Data[0], c1),
                FA2 (A[1], B[1], c1, Data[1], c2),
                FA3 (A[2], B[2], c2, Data[2], c3),
                FA4 (A[3], B[3], c3, Data[3], Data[4]);
    
    register_logic r1(clk, enable, Data, Q);
endmodule