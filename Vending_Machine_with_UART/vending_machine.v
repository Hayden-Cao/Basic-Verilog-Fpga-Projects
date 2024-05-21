`timescale 1ns / 1ps


module vending_machine(

    input quarter_btn, dime_btn, confirm_btn, clk, reset_btn, UART_RX,
    input [2:0] select_switch,
    output [7:0] seven_seg_enb,
    output [6:0] seven_seg_out,
    output green, UART_TX,
    output [8:0] balance,
    output [2:0] state

    );
    
    wire led_enable, seven_seg_enb_flag;
    wire quarter_btn_debounce, dime_btn_debounce, confirm_btn_debounce;
    wire give_change, confirm_uart, quarter_uart, dime_uart;
    
    button_pulse bp_0 (
        
        .clk(clk),
        .raw_button(quarter_btn),
        .button_pulse(quarter_btn_debounce)
        
    );
        
    button_pulse bp_1 (
        
        .clk(clk),
        .raw_button(dime_btn),
        .button_pulse(dime_btn_debounce)
        
    );
    
    button_pulse bp_2 (
        
        .clk(clk),
        .raw_button(confirm_btn),
        .button_pulse(confirm_btn_debounce)
        
    );
    
    wire [8:0] balance_i;
    
    fsm_vend_mach fvm_0 (
    
        .quarter_btn(quarter_btn_debounce),
        .dime_btn(dime_btn_debounce),
        .confirm_btn(confirm_btn_debounce),
        .clk(clk),
        .reset(reset_btn),
        .select_switch(select_switch),
        .state(state),
        .balance(balance_i),
        .color_flag(led_enable),
        .seven_seg_enb(seven_seg_enb_flag),
        .give_change(give_change),
        .confirm_uart(confirm_uart),
        .dime_uart(dime_uart),
        .quarter_uart(quarter_uart)
    
    );

    wire [1:0] sel;

    cnt_4digs c4dig_0 (
    
        .clk(clk),
        .sel(sel)
    
    );
    
    seven_seg_encoder sse_0 (
    
        .select(sel),
        .led_enable(seven_seg_enb_flag),
        .led_enb(seven_seg_enb)
    
    );
    
    green_led gl_0 (
    
        .clk(clk),
        .reset(0),
        .led_enable(led_enable),
        .green(green)
    
    );
    
    wire[11:0] dabbled;
    
    double_dabble dd_0 (
    
        .calc_in(balance_i),
        .dabbled(dabbled)
    
    );
    
    wire[3:0] bcd_out;
    
    bcd_mux bcd_mux_0 (
    
        .double_dabbled(dabbled),
        .select(sel),
        .bcd_mux_out(bcd_out)
    
    );
    
    
    seven_seg_out sso_0 (
    
        .b_in(bcd_out),
        .inv_leds(seven_seg_out)
    
    );
    
    assign balance = balance_i;
    
    
    uart_driver ud0 (
    
        .UART_RX(UART_RX),
        .clk(clk),
        .give_change(give_change),
        .reset(reset_btn),
        .dabbled(dabbled),
        .UART_TX(UART_TX),
        .confirm_uart(confirm_uart),
        .quarter_uart(quarter_uart),
        .dime_uart(dime_uart)
        
    
    );
    
endmodule