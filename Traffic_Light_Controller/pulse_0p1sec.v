`timescale 1ns / 1ps

module pulse_0p1sec (

		     input	clk,
		     input	reset,
		     output reg	pulse
		     );
   
   // 100MHz clock divide by 10 million - needs 24 bits
       reg [23:0]   div_cnt;
       
       always @(posedge clk or posedge reset)
         if (reset) begin
           div_cnt <= 0;
         end else begin
           if (div_cnt >= 9999999)
         begin
            div_cnt <= 0;
            pulse <= 1;
         end
           else
         begin
            div_cnt <= div_cnt + 1;
            pulse <= 0;
         end
    end
   
endmodule