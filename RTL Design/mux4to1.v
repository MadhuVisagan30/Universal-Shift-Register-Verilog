`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.06.2026 18:52:51
// Design Name: 
// Module Name: mux4to1
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


module mux4to1(input in1,in2,in3,in4,input [1:0] sel,
output reg out);
    always @(*)begin
    case(sel)
    2'b00:out=in1;
    2'b01:out=in2;
    2'b10:out=in3;
    2'b11:out=in4;
    endcase
    end
endmodule
