`timescale 1ns / 1ps

module CLA_4bits(
        input clk,
        input enable,
        input [3:0] A, B,
        input Cin,
        output [4:0] Q
    );
    
    wire [3:0] G, P, S;
    wire [4:0] C;
    wire [3:0] Sum;
    wire Cout;
    
    assign G = A & B;
    assign P = A ^ B;
    assign C[0] = Cin;
    assign C[1] = G[0] | (P[0] & C[0]);
    assign C[2] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & C[0]);
    assign C[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & C[0]);
    assign Cout = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) |(P[3] & P[2] & P[1] & P[0] & C[0]);
    assign S = P ^ C;
    
    assign Q = {Cout, S};
    
    register_logic r1(.clk(clk), .enable(enable), .Q(Q));
endmodule