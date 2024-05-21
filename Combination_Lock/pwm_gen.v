`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2024 11:01:39 PM
// Design Name: 
// Module Name: pwm_gen
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: generate 25% and 12.5% duty cycle signals, divided down from 100MHz clock
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

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

