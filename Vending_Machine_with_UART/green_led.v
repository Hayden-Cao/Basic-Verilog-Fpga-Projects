`timescale 1ns / 1ps



module green_led(

    input clk, reset, led_enable,
    output green

    );
    
    reg [11:0]pwm_cnt;
   
   always @(posedge clk or posedge reset)
     if (reset | ~led_enable)
       pwm_cnt <= 0;
     else
       pwm_cnt <= pwm_cnt + 1;

   assign green = pwm_cnt[11] & pwm_cnt[10];
   

endmodule
