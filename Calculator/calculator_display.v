`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/23/2024 10:29:53 PM
// Design Name: 
// Module Name: calculator_display
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module calculator_display(

    input [1:0] OP,
    input [3:0] A,B,
    input clk,
    output [7:0] led_enable,
    output [6:0] seven_seg,
    output [1:0] overflow_cout
    
    );
    
    wire [7:0] calc_out;
    
    calculator calc1 (
    
       .OP(OP),
       .A(A),
       .B(B),
       .out(calc_out)
    
    );
    
    assign overflow_cout[1] = calc_out[7] & ~OP[1];
    assign overflow_cout[0] = calc_out[4] & ~OP[1];
        
    
    wire [7:0] binary_for_bcd;
    wire neg_flag;
    
    twos_Comp tc1 (
    
        .calc_out(calc_out),
        .OP1(OP[1]),
        .binary_for_bcd(binary_for_bcd),
        .neg_flag(neg_flag)
    
    );
    
    wire[11:0] bcd_converted;
    
    double_dabble dd1(
    
        .calc_in(binary_for_bcd),
        .dabbled(bcd_converted)
    
    );
    
    wire[1:0] select;
    
    cnt_4digs cnt1 (
    
        .clk(clk),
        .sel(select)
    
    );
    
    wire [3:0] bcd_mux_out;
    
    bcd_mux bmux1 (
    
       .double_dabbled(bcd_converted),
       .select(select),
       .bcd_mux_out(bcd_mux_out)
    
    );
        
    wire[6:0] leds_in;
    
    seven_seg_out sso1 (
    
        .b_in(bcd_mux_out),
        .inv_leds(leds_in)
    
    );
    
    seven_seg_encoder sse1 (
    
        .select(select),
        .led_enb(led_enable)
    
    );
    
    neg_sign_mux nsm1 (
    
        .select(select),
        .neg_flag(neg_flag),
        .leds_in(leds_in),
        .led_out(seven_seg)
    
    );
    
    
endmodule
