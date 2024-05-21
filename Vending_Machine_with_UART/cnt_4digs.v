`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/23/2024 11:23:50 PM
// Design Name: 
// Module Name: cnt_4digs
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


module cnt_4digs(

        input clk,
        output [1:0] sel
        
    );
    
    reg [15:0] cntbig;
    
    always @(posedge clk)
        begin
            cntbig <= cntbig + 1;
        end
        
    assign sel = cntbig[15:14];
    
    
endmodule
