`timescale 1ns / 1ps


module pwm_gen(
		 input clk,
		 input reset,
		 output pwm_12p5,
		 output pwm_25
		 );
		 
   reg [11:0]	pwm_cnt;
   
   always @(posedge clk or posedge reset)
     if (reset)
       pwm_cnt <= 0;
     else
       pwm_cnt <= pwm_cnt + 1;

   assign pwm_12p5 = pwm_cnt[11] & pwm_cnt[10] & pwm_cnt[9];
   assign pwm_25 = pwm_cnt[11] & pwm_cnt[10];
   
endmodule