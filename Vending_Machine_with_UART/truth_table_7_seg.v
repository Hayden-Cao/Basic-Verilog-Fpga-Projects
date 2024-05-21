`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/23/2024 10:40:41 PM
// Design Name: 
// Module Name: truth_table_7_seg
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



module truth_table_7_seg(

    input [3:0] b_in,
    output reg [6:0] leds
   
    );
    
    
    always @(b_in) begin
    
        case (b_in)
            0: leds = 7'b0111111;
            1: leds = 7'b0000110;
            2: leds = 7'b1011011;
            3: leds = 7'b1001111;
            4: leds = 7'b1100110;
            5: leds = 7'b1101101;
            6: leds = 7'b1111101;
            7: leds = 7'b0000111;
            8: leds = 7'b1111111;
            9: leds = 7'b1101111;
            default: leds = 7'b1111111;
        endcase
    end 
    
endmodule
