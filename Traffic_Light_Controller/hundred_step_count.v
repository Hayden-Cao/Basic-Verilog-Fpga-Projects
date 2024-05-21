`timescale 1ns / 1ps

module hundred_step_counter(

    input pulse,
    input reset,
    output[6:0] hundred

    );
    
    reg [6:0]temp = 0;
    
    always @(posedge pulse or posedge reset) begin
    
        if(reset || (temp > 99)) begin
            temp <= 0;
        end 
        else if (pulse) begin
            temp <= temp + 1;
        end 
        
    end
    
    assign hundred = temp; 
    
    
endmodule
