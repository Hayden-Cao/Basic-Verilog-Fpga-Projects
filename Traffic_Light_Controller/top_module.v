`timescale 1ns / 1ps

module top_module(

    input clk,
    input reset,
    output [1:0] green,
    output [1:0] red,
    output blue,
    output [7:0] led_enable,
    output [6:0] seven_seg_out

    );
    
    wire pwm_12p5_i, pwm_25_i;
    wire [6:0] count_temp;
    wire [1:0] green_i;
    wire [1:0] red_i;
    wire blue_i;
    wire [1:0] select_i;
    wire [6:0] sso_i;
    wire [7:0] sse_i;
    wire [3:0] bcd_out_i;
    
    
    pwm_gen pwg_1 (
    
        .clk(clk),
        .reset(reset),
        .pwm_12p5(pwm_12p5_i),
        .pwm_25(pwm_25_i)
    
    );
    
    
    ten_second_counter tsc_1 (
    
        .clk(clk),
        .reset(reset),
        .ten_sec(count_temp)
    
    );
    
    led_control lc_1 (
    
        .ten_secs(count_temp),
        .pwm_12p5(pwm_12p5_i),
        .pwm_25(pwm_25_i),
        .green(green_i),
        .red(red_i),
        .blue(blue_i)
    
    );
    
    walk_time wt_1 (
    
        .ten_sec(count_temp),
        .bcd_out(bcd_out_i)
    
    );
    
    cnt_4digs cnt1 (
    
        .clk(clk),
        .sel(select_i)
    
    );
    
    seven_seg_encoder sse1 (
    
        .select(select_i),
        .led_enb(sse_i)
    
    );
    
    seven_seg_out sso1 (
    
        .b_in( bcd_out_i ),
        .inv_leds(sso_i)
    
    );
    
    assign green[1] = green_i[1];
    assign green[0] = green_i[0];
    assign red[1]   = red_i[1];
    assign red[0]   = red_i[0];
    assign blue = blue_i;
    assign led_enable = sse_i;
    assign seven_seg_out = sso_i;

    
endmodule
