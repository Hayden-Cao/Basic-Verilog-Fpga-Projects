`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/24/2024 08:49:51 AM
// Design Name: 
// Module Name: twos_Comp
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


module twos_Comp(

        input [7:0] calc_out,
        input OP1,
        output reg[7:0] binary_for_bcd,
        output reg neg_flag

    );
    
    
    always @(calc_out, OP1) begin
    
            if (OP1 == 1) begin
            
                binary_for_bcd = calc_out;
                neg_flag = 0;
                
            end
      
            else if (~OP1 & calc_out[7] & calc_out[4]) begin
                //unneeded logic because it deals with the overflow case
                //but performing twos complement does show the "correct" theoretical sum
                
                binary_for_bcd[7] = 0;
                binary_for_bcd[6] = 0;
                binary_for_bcd[5] = 0;
                binary_for_bcd[4] = 0;
                
                binary_for_bcd[3] = calc_out[3] ^ 1;
                binary_for_bcd[2] = calc_out[2] ^ 1;
                binary_for_bcd[1] = calc_out[1] ^ 1;
                binary_for_bcd[0] = calc_out[0] ^ 1;
                
                binary_for_bcd = binary_for_bcd + 1;
                neg_flag = 1;
                   
            end
            
            else if (~OP1 & ~calc_out[7] & ~(calc_out[3])) begin
            
                binary_for_bcd[7] = 0;
                binary_for_bcd[6] = 0;
                binary_for_bcd[5] = 0;
                binary_for_bcd[4] = 0;
            
                binary_for_bcd[3] = calc_out[3];
                binary_for_bcd[2] = calc_out[2];
                binary_for_bcd[1] = calc_out[1];
                binary_for_bcd[0] = calc_out[0];
                
                neg_flag = 0;
            
            end
            
            
  
              else if (~OP1 & ~calc_out[7] & calc_out[3]) begin
            
                binary_for_bcd[7] = 0;
                binary_for_bcd[6] = 0;
                binary_for_bcd[5] = 0;
                binary_for_bcd[4] = 0;
            
                binary_for_bcd[3] = calc_out[3] ^ 1;
                binary_for_bcd[2] = calc_out[2] ^ 1;
                binary_for_bcd[1] = calc_out[1] ^ 1;
                binary_for_bcd[0] = calc_out[0] ^ 1;
                
                binary_for_bcd = binary_for_bcd + 1;
                neg_flag = 1;
            
            end
      
            else begin
                
                binary_for_bcd = {1'b0, calc_out[6:0] };
                neg_flag = 0;
            
            end
            
            if (binary_for_bcd == 16) begin
            
                binary_for_bcd = 0;
                neg_flag = 0;
            
            end
                 
    end
    
endmodule
