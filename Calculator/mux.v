`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/23/2024 10:33:57 PM
// Design Name: 
// Module Name: mux
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


module mux(

    input overflow,
    input [4:0] sum,
    input [7:0] product,
    input [1:0] OP,
    output reg [7:0] out

    );
    
    always @(*) begin
        case (OP)
            2'b00:
                begin
                    out[7] <= overflow;
                    out[6] <= 1'b0;
                    out[5] <= 1'b0;
                    out[4] <= sum[4];
                    out[3] <= sum[3];
                    out[2] <= sum[2];
                    out[1] <= sum[1];
                    out[0] <= sum[0];
                end
            2'b01:
                begin
                    out[7] <= overflow;
                    out[6] <= 1'b0;
                    out[5] <= 1'b0;
                    out[4] <= sum[4];
                    out[3] <= sum[3];
                    out[2] <= sum[2];
                    out[1] <= sum[1];
                    out[0] <= sum[0];
                end
             2'b10:
                begin
                    out[7] <= product[7];
                    out[6] <= product[6];
                    out[5] <= product[5];
                    out[4] <= product[4];
                    out[3] <= product[3];
                    out[2] <= product[2];
                    out[1] <= product[1];
                    out[0] <= product[0];
                end
                
             2'b11:
                begin
                    out[7] <= product[7];
                    out[6] <= product[6];
                    out[5] <= product[5];
                    out[4] <= product[4];
                    out[3] <= product[3];
                    out[2] <= product[2];
                    out[1] <= product[1];
                    out[0] <= product[0];
                end
                
        endcase 
    end
    
    
endmodule

