`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/07 15:05:49
// Design Name: 
// Module Name: read
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

module read(
	input [11:0] data, clk, rst_n,
	output [15:0] signal, [2:0] band, [4:0] time_len, [15:0] addr_a
);
wire [3:0] i;
localparam quarter = 50000000 / 16;
integer tmp, cnt;
assign i = data[11:8];
assign band = data[7:5];
assign time_len = data[4:0];
assign tmp = signal * quarter;
always@(posedge clk or negedge rst_n)
begin
	if(~rst_n)
		cnt <= 0;
	else if(cnt <= tmp)
		cnt <= cnt + 1;
	else if(time_len == 0)
		cnt <= 0;
	else if(cnt == tmp)
		addr_a += 1;
end
always@(*)
begin
	signal = 0;
	if(i >= 0)
		signal[i+1] = 1;
end
endmodule
