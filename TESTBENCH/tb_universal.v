`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.06.2026 20:30:51
// Design Name: 
// Module Name: tb_universal
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


module tb_universal(

    );
    reg clk,reset,serial_left,serial_right;
    reg [1:0] sel;
    reg [3:0] I;
    wire [3:0] A;
    wire serial_left_out,serial_right_out;
    
    universal_sft_reg dut(clk,reset,serial_right,serial_left,sel[1:0],
    I[3:0], A[3:0], serial_right_out,serial_left_out);
    
    initial begin
        clk=0;
        reset=1;
        serial_left=0;
        serial_right=0;
        sel=2'b0;
        I=4'b0;
        end
    always #10 clk=~clk;
    initial begin
        #5 reset=0;
        #10 sel=2'd3;
        #5  I=4'd10;
        #20 sel=2'd0;
        #10 sel=2'd1;
        #75 sel=2'd0;
        #20 sel=2'd3;
        #5 I=4'd5;
         #20 sel=2'd0;
        #10 sel=2'd2;
        #75 sel=2'd0;
        #10;
        $finish;
        end
        
        initial begin
        $monitor("t=%0t clk=%b sel=%b I=%b serial_left=%b serial_right=%b",$time,clk,sel,I[3:0],serial_left,serial_right);
        end
        
endmodule
