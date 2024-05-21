`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/23/2024 10:33:23 PM
// Design Name: 
// Module Name: multiplier
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


module multiplier(

    input[3:0] x, [3:0] y,
    output [7:0] product 

    );
    
    wire [3:0] multi_1;
    wire [3:0] multi_2;
    wire [3:0] multi_3;
    wire [3:0] multi_4;
    
    wire [3:0] sum_1;
    wire [3:0] sum_2;
    wire [3:0] sum_3;
    
    wire [2:0]c_out;
    
    
    assign multi_1[3] = x[3] & y[0];
    assign multi_1[2] = x[2] & y[0];
    assign multi_1[1] = x[1] & y[0];
    assign multi_1[0] = x[0] & y[0];
    
    assign multi_2[3] = x[3] & y[1];
    assign multi_2[2] = x[2] & y[1];
    assign multi_2[1] = x[1] & y[1];
    assign multi_2[0] = x[0] & y[1];
    
    assign multi_3[3] = x[3] & y[2];
    assign multi_3[2] = x[2] & y[2];
    assign multi_3[1] = x[1] & y[2];
    assign multi_3[0] = x[0] & y[2];
    
    assign multi_4[3] = x[3] & y[3];
    assign multi_4[2] = x[2] & y[3];
    assign multi_4[1] = x[1] & y[3];
    assign multi_4[0] = x[0] & y[3];
    
    
    four_bit_adder FBA0(
    
        .addsub(0),
        .x({1'b0, multi_1[3], multi_1[2], multi_1[1]}),
        .y(multi_2),
        .result(sum_1),
        .c_out(c_out[0]),
        .overflow()
        
    );
    
    wire [3:0] addend1;
    
    assign addend1[3] = c_out[0];
    assign addend1[2] = sum_1[3];
    assign addend1[1] = sum_1[2];
    assign addend1[0] = sum_1[1];
    
    four_bit_adder FBA1(
    
        .addsub(0),
        .x(multi_3),
        .y(addend1),
        .result(sum_2),
        .c_out(c_out[1]),
        .overflow()
        
    );
    
    wire [3:0] addend2;
    
    assign addend2[3] = c_out[1];
    assign addend2[2] = sum_2[3];
    assign addend2[1] = sum_2[2];
    assign addend2[0] = sum_2[1];
    
    four_bit_adder FBA2(
    
        .addsub(0),
        .x(multi_4),
        .y(addend2),
        .result(sum_3),
        .c_out(c_out[2]),
        .overflow()
        
    );
    
    assign product[7] = c_out[2];
    assign product[6] = sum_3[3];
    assign product[5] = sum_3[2];
    assign product[4] = sum_3[1];
    assign product[3] = sum_3[0];
    assign product[2] = sum_2[0];
    assign product[1] = sum_1[0];
    assign product[0] = multi_1[0];
   
    
endmodule

