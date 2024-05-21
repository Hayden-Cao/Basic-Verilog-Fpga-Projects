`timescale 1ns / 1ps


module tx_parse(
   input clk, 
   input reset,
   output tx_dv, 
   output reg [7:0] tx_byte, 
   input tx_ready, 
   input give_change,
   input [11:0] amount_bcd
   );
    
   reg [12:0] old_values;
   reg [2:0] char_cnt;
   reg prev_tx_ready;

   always @(*)
      case(char_cnt)
          6: tx_byte = (give_change) ? 8'h2D : 8'h2B;  // outputs a "-" if we are giving change, other wise a "+"
          5: tx_byte = 8'h30 + amount_bcd[11:8];       // ASCII hundreds place digit
          4: tx_byte = 8'h30 + amount_bcd[7:4];        // ASCII tens place digit
          3: tx_byte = 8'h30 + amount_bcd[3:0];        // ASCII ones place digit
          2: tx_byte = 8'h0D;                          // carriage return
          1: tx_byte = 8'h0A;                          // line feed
          default: tx_byte = 0;
      endcase

   assign  tx_dv = (tx_ready && (char_cnt != 0));   // set data_valid if we still have characters to send and the TX is ready
   
   always @(posedge clk or posedge reset)
   begin
      if (reset) begin
         old_values <= 0;
         char_cnt <= 0;
         prev_tx_ready <= 0;
      end else begin
         if ((char_cnt != 0) && (~tx_ready & prev_tx_ready))    // point to next character when tx_ready goes low
            char_cnt <= char_cnt - 1;
         if ((char_cnt == 0) && (old_values != {give_change, amount_bcd}))   // if amount changed, send new amount
            char_cnt <= 6;
         old_values <= {give_change, amount_bcd};
         prev_tx_ready <= tx_ready;
      end   
   end

endmodule
