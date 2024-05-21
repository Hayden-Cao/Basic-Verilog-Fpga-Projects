`timescale 1ns / 1ps


module combo_lock(

    input clk, left_btn, right_btn, up_btn, down_btn, clear_btn, set_switch,
    output [3:0] state_led,
    output led_g, led_r, led_b

    );
    
    wire left_debounce;
    wire right_debounce;
    wire up_debounce;
    wire down_debounce;
    wire clear_debounce;
    wire [1:0] colors;
    

    
    button_pulse left_b (
    
        .clk(clk),
        .raw_button(left_btn),
        .button_pulse(left_debounce)
    
    );
    
    button_pulse right_b (
    
        .clk(clk),
        .raw_button(right_btn),
        .button_pulse(right_debounce)
    
    );
    
    button_pulse up_b (
    
        .clk(clk),
        .raw_button(up_btn),
        .button_pulse(up_debounce)
    
    );    
    
    button_pulse down_b (
    
        .clk(clk),
        .raw_button(down_btn),
        .button_pulse(down_debounce)
    
    );    
    
     button_pulse clear_b (
    
        .clk(clk),
        .raw_button(clear_btn),
        .button_pulse(clear_debounce)
    
    );
    
    fsm_set_and_lock fsm1 (
    
        .clk(clk),
        .clear_btn(clear_debounce),
        .left_btn(left_debounce),
        .right_btn(right_debounce),
        .up_btn(up_debounce),
        .down_btn(down_debounce),
        .set_switch(set_switch),
        .state(state_led),
        .password(),
        .color(colors)
    
    );
    
    led_color_rygb led1 (
    
        .clk(clk),
        .reset(clear_debounce),
        .color(colors),
        .led_r(led_r),
        .led_g(led_g),
        .led_b(led_b)
    
    );
    
           
endmodule
