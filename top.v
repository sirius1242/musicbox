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
		assign data[2:0] = band;
		wire [2:0] band;
		//assign data = 32'h0000;
		no_fitter fit1(rst_n, clk, play);
		no_fitter fit2(left, clk, dec);
		no_fitter fit3(right, clk, inc);
		musicbox test(SW, play, clk, dec, inc, bell, LED, en, band);
		seg seg1(clk, rst_n, data, sel, segment);
endmodule
