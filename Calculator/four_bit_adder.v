`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/23/2024 10:32:15 PM
// Design Name: 
// Module Name: four_bit_adder
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


module four_bit_adder(
    
    input addsub,
    input [3:0]x, [3:0]y,
    output [3:0]result,
    output c_out,
    output overflow
    
    );
    
    wire[3:0] twos_C;
    wire[3:0] carry;
    
    assign twos_C[3] = y[3] ^ addsub;
    assign twos_C[2] = y[2] ^ addsub;
    assign twos_C[1] = y[1] ^ addsub;
    assign twos_C[0] = y[0] ^ addsub;
    
    full_adder FA0 (
    
        .x(x[0]),
        .y(twos_C[0]),
        .c_in(addsub),
        .s(result[0]),
        .c_out(carry[0])
    
    );
    
        full_adder FA1 (
    
        .x(x[1]),
        .y(twos_C[1]),
        .c_in(carry[0]),
        .s(result[1]),
        .c_out(carry[1])
    
    );
    
        full_adder FA2 (
    
        .x(x[2]),
        .y(twos_C[2]),
        .c_in(carry[1]),
        .s(result[2]),
        .c_out(carry[2])
    
    );
    
        full_adder FA3 (
    
        .x(x[3]),
        .y(twos_C[3]),
        .c_in(carry[2]),
        .s(result[3]),
        .c_out(carry[3])
    
    );
    
    assign c_out = carry[3]; 
    assign overflow = carry[3] ^ carry[2];
    
    
endmodule


