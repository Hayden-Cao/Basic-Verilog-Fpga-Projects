`timescale 1ns / 1ps

module cnt_4digs(

        input clk,
        output [1:0] sel
        
    );
    
    reg [15:0] cntbig;
    
    always @(posedge clk)
        begin
            cntbig <= cntbig + 1;
        end
        
    assign sel = cntbig[15:14];
    
    
endmodule