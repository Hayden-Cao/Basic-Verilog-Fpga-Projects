`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/23/2024 11:15:21 PM
// Design Name: 
// Module Name: bcd_mux
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


module bcd_mux(

    input[11:0] double_dabbled,
    input[1:0] select,
    output reg [3:0]bcd_mux_out

    );
    
     always @(double_dabbled, select) begin
    
        case(select)
            2'b00 : bcd_mux_out[3:0] = double_dabbled[3:0];
            2'b01 : bcd_mux_out[3:0] = double_dabbled[7:4];
            2'b10 : bcd_mux_out[3:0] = double_dabbled[11:8];
            2'b11 : bcd_mux_out[3:0] = 4'b0000;
        endcase 
    
    end
    
endmodule