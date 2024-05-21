`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/23/2024 10:44:28 PM
// Design Name: 
// Module Name: double_dabble
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


module double_dabble(

    input [7:0] calc_in,
    output [11:0] dabbled

    );
    
    
  wire [3:0] a1_out;
    
   add_3 a1 (
   
        .in({1'b0, calc_in[7], calc_in[6], calc_in[5]}),
        .out(a1_out)
   
   ); 
   
   
   wire [3:0] a2_out;
   
   add_3 a2 (
   
        .in({ a1_out[2], a1_out[1], a1_out[0], calc_in[4] }),
        .out(a2_out)
   
   ); 
   
   wire [3:0] a3_out;
   
   add_3 a3 (
   
        .in({ a2_out[2], a2_out[1], a2_out[0], calc_in[3] }),
        .out(a3_out)
   
   );
   
   wire [3:0] a4_out;
   
   add_3 a4 (
   
        .in({ a3_out[2], a3_out[1], a3_out[0], calc_in[2] }),
        .out(a4_out)
   
   );  

   wire [3:0] a5_out;
   
   add_3 a5 (
   
        .in({ a4_out[2], a4_out[1], a4_out[0], calc_in[1] }),
        .out(a5_out)
   
   );  
   
   wire [3:0] a6_out;
   
   add_3 a6 (
   
        .in({ 1'b0, a1_out[3], a2_out[3], a3_out[3] }),
        .out(sa6_out)
   
   );  
   
   wire [3:0] a7_out;
   
   add_3 a7 (
   
        .in({a6_out[2], a6_out[1], a6_out[0], a4_out[3] }),
        .out(a7_out)
   
   );  
   
   assign dabbled[11] = 0;
   assign dabbled[10] = 0;
   
   assign dabbled[9] = a6_out[3];
   assign dabbled[8] = a7_out[3];
   assign dabbled[7] = a7_out[2];
   assign dabbled[6] = a7_out[1];
   
   assign dabbled[5] = a7_out[0];
   assign dabbled[4] = a5_out[3];
   assign dabbled[3] = a5_out[2];
   assign dabbled[2] = a5_out[1];
   assign dabbled[1] = a5_out[0];
   
   assign dabbled[0] = calc_in[0];
    
    
    
endmodule