`timescale 1ns / 1ps

module RCA_4bits(
        input clk,
        input enable,
        input [3:0] A, B,
        input Cin,
        output [4:0] Q
    );
    
    register_logic(clk, enable, Q);
endmodule
