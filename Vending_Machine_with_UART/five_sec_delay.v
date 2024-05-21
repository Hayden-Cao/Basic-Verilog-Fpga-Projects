`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/24/2024 09:12:13 PM
// Design Name: 
// Module Name: five_sec_delay
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


module five_sec_delay(

    input clk, enable, reset,
    output reg pulse

    );
    
    // 100 MHz / 500 million = 0.2 Hz = 5 seconds
    // 29 bits to hold 500 million
    reg [28:0] count; 
    
    always @(posedge clk or posedge reset)
    begin
    
        if (reset)
            count <= 0;
        else if (enable)
        begin
        
                if (count >= 500000000)
                begin
                    count <= 0;
                    pulse <= 1;
                end else
                begin
                
                    count <= count + 1;
                    pulse <= 0;
                
                end
        
        end else
            pulse <= 0;
    
    end
    
    
endmodule
