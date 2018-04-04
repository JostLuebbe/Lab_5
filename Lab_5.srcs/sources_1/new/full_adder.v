`timescale 1ns / 1ps

module full_adder(
        input A, B, Cin,
        output S, Cout
    );
    wire s1, c1, c2;
    
    xor (S, A, B, Cin);
    or (Cout, B & Cin, A & Cin, A & B);
endmodule