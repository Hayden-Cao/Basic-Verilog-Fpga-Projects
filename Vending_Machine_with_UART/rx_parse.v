`timescale 1ns / 1ps

module rx_parse(
   input clk,
   input reset, 
   input rx_dv,
   input [7:0] rx_byte, 
   output reg select_rx, 
   output reg q25_rx, 
   output reg d10_rx
   );

    always @(posedge clk or posedge reset)
    begin
        if (reset) begin
            select_rx <= 0;
            q25_rx <= 0;
            d10_rx <= 0;
        end else begin
            select_rx <= (rx_dv && rx_byte == 8'h53);  // capital S
            q25_rx <= (rx_dv && rx_byte == 8'h51);   // captial Q
            d10_rx <= (rx_dv && rx_byte == 8'h44);   // capital D
        end
    end

endmodule

