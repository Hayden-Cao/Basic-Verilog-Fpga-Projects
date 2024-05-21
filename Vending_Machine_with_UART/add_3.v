`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/23/2024 10:45:25 PM
// Design Name: 
// Module Name: shift_add_3
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


module add_3 (

    input [3:0] in,
    output reg [3:0] out
    
);


    always @ (in) begin
    
        if (in >= 5)
            out = in + 3;
        else
            out = in;
            
    end
    
    
endmodule