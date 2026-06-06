`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.06.2026 18:51:25
// Design Name: 
// Module Name: universal_sft_reg
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


module universal_sft_reg (input clk,reset,serial_right,serial_left,input [1:0] sel,
    input [3:0] I,output [3:0] A,output serial_right_out,serial_left_out);
    
    wire d0,d1,d2,d3;
    
    mux4to1 m3(A[3],serial_right,A[2],I[3],sel,d3);
    d_ff one(clk,reset,d3,A[3]);
    
    mux4to1 m2(A[2],A[3],A[1],I[2],sel,d2);
    d_ff two(clk,reset,d2,A[2]);
    
    mux4to1 m1(A[1],A[2],A[0],I[1],sel,d1);
    d_ff three(clk,reset,d1,A[1]);
    
    mux4to1 m0(A[0],A[1],serial_left,I[0],sel,d0);
    d_ff four(clk,reset,d0,A[0]);
    
    assign serial_left_out=A[3];
    assign serial_right_out=A[0];
endmodule
