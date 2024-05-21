`timescale 1ns / 1ps

module led_color_rygb(
		 input clk,
		 input reset,
		 input [1:0] color,
		 output reg led_r,
		 output reg led_g,
		 output reg led_b
		 );
   
   parameter RED = 0;
   parameter YELLOW = 1;
   parameter GREEN = 2;
   parameter BLUE = 3;
   
   wire			pwm_12p5;
   wire         pwm_25;

   pwm_gen u1 (clk, reset, pwm_12p5, pwm_25);
   					  
   always @(*)
     case (color)
       RED: // red
	 begin
	    led_r = pwm_25;
	    led_g = 0;
	    led_b = 0;
	 end
       YELLOW: // yellow
	 begin
	    led_r = pwm_25;
	    led_g = pwm_12p5;
	    led_b = 0;
	 end
       GREEN: // green
	 begin
	    led_r = 0;
	    led_g = pwm_25;
	    led_b = 0;
	 end
       BLUE: // BLUE
	 begin
	    led_r = 0;
	    led_g = 0;
	    led_b = pwm_25;
	 end

     endcase       
endmodule   
