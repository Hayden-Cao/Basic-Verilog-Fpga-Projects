`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/24/2024 09:37:42 AM
// Design Name: 
// Module Name: neg_sign_mux
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


module neg_sign_mux(

    input [1:0]select,
    input neg_flag,
    input [6:0] leds_in,
    output reg [6:0]led_out

    );
    
    
    always @(select, neg_flag) begin
    
        if (select == 2'b11 && neg_flag) begin
        
            led_out = 7'b0111111;
        
        end
        
        else begin
        
            led_out = leds_in;
            
        end
    
    end
        
endmodule
