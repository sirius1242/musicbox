`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/16 19:12:38
// Design Name: 
// Module Name: fitter
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


module no_fitter(
	input raw, rst_n, clk,
	output reg en 
);
localparam milli = 50000000 / 1000;
integer cnt;
always@(posedge clk or negedge rst_n)
begin
	if(~rst_n)
		cnt <= 0;
	else if(raw)
		cnt <= 0;
	else if(cnt <= milli)
		cnt <= cnt + 1;
end
always@(*)
begin
	if(cnt == milli)
		en <= 1;
	else
		en <= 0;
end
endmodule
