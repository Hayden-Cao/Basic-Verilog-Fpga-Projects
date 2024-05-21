`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/23/2024 10:40:54 PM
// Design Name: 
// Module Name: inverter
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


module inverter(

    input [6:0] a,
    output [6:0] x
    );
    
  
    assign x[6] = ~a[6];
    assign x[5] = ~a[5];
    assign x[4] = ~a[4];
    assign x[3] = ~a[3];
    assign x[2] = ~a[2];
    assign x[1] = ~a[1];
    assign x[0] = ~a[0];
  
  
endmodule