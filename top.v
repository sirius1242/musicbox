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
		output en
    );
		musicbox test(SW, rst_n, clk, left, right, bell, LED, en);
endmodule
