`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2024 11:10:46 PM
// Design Name: 
// Module Name: walk_time
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


module walk_time(

    input [6:0] ten_sec,
    output reg[3:0] bcd_out

    );
    
    always @(ten_sec) begin
    
        if (ten_sec < 10) begin
        
            bcd_out = 4'b0100;
        
        end
        
        else if (ten_sec < 20) begin
        
            bcd_out = 4'b0011;
        
        end
        
        else if (ten_sec < 30) begin
        
            bcd_out = 4'b0010;
        
        end
        
        else if (ten_sec < 40) begin
        
            bcd_out = 4'b0001;
        
        end
        
        else if (ten_sec < 50) begin
        
            bcd_out = 4'b0000;
        
        end
        
        else if (ten_sec < 60) begin
        
            bcd_out = 4'b0100;
        
        end
        
        
        else if (ten_sec < 70) begin
        
            bcd_out = 4'b0011;
        
        end
        
        else if (ten_sec < 80) begin
        
            bcd_out = 4'b0010;
        
        end
        
        else if (ten_sec < 90) begin
        
            bcd_out = 4'b0001;
        
        end
        
        else if (ten_sec < 100) begin
        
            bcd_out = 4'b0000;
        
        end     
        
    
    end
    
endmodule
