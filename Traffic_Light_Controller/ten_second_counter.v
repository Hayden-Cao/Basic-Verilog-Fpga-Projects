`timescale 1ns / 1ps


module ten_second_counter(

    input clk,
    input reset,
    output[6:0] ten_sec

    );
    
    
    wire pulse_wire;
    
    pulse_0p1sec p_0p1_1(
    
        .clk(clk),
        .reset(reset),
        .pulse(pulse_wire)
    
    );
    
    hundred_step_counter hsc_1 (
    
        .pulse(pulse_wire),
        .reset(reset),
        .hundred(ten_sec)
    
    );
    
    
    
endmodule
