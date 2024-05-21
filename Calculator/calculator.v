`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/23/2024 10:31:47 PM
// Design Name: 
// Module Name: calculator
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module calculator(

    input [1:0] OP,
    input [3:0] A,B,
    output [7:0] out

    );
    
    wire cout, overflow;
    wire[3:0] adder_out;
    wire[7:0] product;
    
        four_bit_adder FBA (
    
        .addsub(OP[0]),
        .x(A),
        .y(B),
        .result(adder_out),
        .c_out(c_out),
        .overflow(overflow)
        
    );

    multiplier MULTI (
  
        .x(A),
        .y(B),
        .product(product)
    );
    
    mux MUX0 (
    
        .overflow(overflow),
        .sum({c_out, adder_out}),
        .product(product),
        .OP(OP),
        .out(out)
    
    );

endmodule


