`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2024 09:28:02 PM
// Design Name: 
// Module Name: led_control
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


module led_control(

    input [6:0]ten_secs,
    input pwm_12p5,
    input pwm_25,
    output reg[1:0] green,
    output reg[1:0] red,
    output blue

    );
    
    assign blue = 0;
    
    always @(ten_secs) begin
    
        // 1st bit = left led, 0th bit = right led
    
        if (ten_secs < 40) begin
        
            green = {pwm_25, 1'b0};
            red = {1'b0, pwm_25};
        
        end
        
        else if (ten_secs < 48) begin
        
            green = {pwm_12p5, 1'b0};
            red = {pwm_12p5, pwm_25};
        
        end 
        
        else if (ten_secs < 50) begin
        
            green = {1'b0, 1'b0};
            red = {pwm_25, pwm_25};
        
        end
        
        else if (ten_secs < 90) begin
        
            green = {1'b0, pwm_25};
            red = {pwm_25, 1'b0};
        
        end
        
        else if (ten_secs < 98) begin
        
            green = {1'b0, pwm_12p5};
            red = {pwm_25, pwm_12p5};
        
        end
        
        else if (ten_secs <= 100) begin
        
            green = {1'b0, 1'b0};
            red = {pwm_25, pwm_25};
        
        end
    
    end
    
endmodule
