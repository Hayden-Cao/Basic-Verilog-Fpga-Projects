`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/23/2024 11:17:28 PM
// Design Name: 
// Module Name: seven_seg_encoder
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


module seven_seg_encoder(

    input [1:0]select,
    output reg[7:0]led_enb

    );
    
    
    always@(select) begin
        
        case(select)
            2'b00 : led_enb = 8'b11111110;
            2'b01 : led_enb = 8'b11111101;
            2'b10 : led_enb = 8'b11111011;
            2'b11 : led_enb = 8'b11110111;
        endcase
    end
    
endmodule
