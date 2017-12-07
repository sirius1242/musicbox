`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/07 15:05:49
// Design Name: 
// Module Name: top
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


module top(
    input [15:0] SW,
    input rst_n, clk, left, right,
    output bell,
		output [15:0] LED,
		output en,
		output [2:0] sel,
		output [6:0] segment
    );
		wire [31:0] data;
		assign data[4:0] = factor;
		wire [4:0] factor;
		//assign data = 32'h0000;
		musicbox test(SW, rst_n, clk, left, right, bell, LED, en, factor);
		seg seg1(clk, rst_n, data, sel, segment);
endmodule
