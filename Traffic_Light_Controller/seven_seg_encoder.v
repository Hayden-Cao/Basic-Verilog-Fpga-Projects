`timescale 1ns / 1ps

module seven_seg_encoder(

    input select,
    output reg[7:0]led_enb

    );
    
    
    always@(select) begin
        
        case(select)
            1'b0 : led_enb = 8'b11111110;
        endcase
    end
    
endmodule