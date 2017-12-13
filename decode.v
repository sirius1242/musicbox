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
	input [11:0] data,
	input clk, rst_n,
	input [15:0] addr,
	input pause, pre, next, [2:0] len,
	output reg [15:0] signal, [2:0] band, reg [15:0] addr_a,
 	output reg en, reg [2:0] sel
);
wire [3:0] i;
wire [4:0] time_len;
localparam quarter = 50000000 / 8;
localparam milli = 50000000 / 1000;
reg [31:0] tmp;
reg flag;

//reg en; 
integer cnt;
assign i = data[11:8];
assign band = data[7:5];
assign time_len = data[4:0];
always@(posedge clk or negedge rst_n)
begin
	if(~rst_n)
	begin
		cnt <= 0;
		addr_a <= 0;
		signal <= 0;
		en <= 0;
		sel <= 0;
		tmp <= 16 * quarter;
	end
	else if(next)
	begin
		sel <= (sel>=len)? 0:sel+1;
		flag <= 1;
	end
	else if(pre)
	begin
		sel <= (sel==0)? len:sel-1 ;
		flag <= 1;
	end
	else if(flag == 1)
	begin
		flag <= 0;
		addr_a <= addr;
	end
	else if(pause)
		en <= ~en;
	else if(~en)
		cnt <= cnt;
	else if(cnt == 0)
	begin
		tmp <= time_len * quarter;
		cnt <= cnt + 1;
		signal[i] <= i?1:0;
	end
	else if(tmp == 0)
		en <= 0;
	else if(cnt >= tmp + milli)
	begin
		cnt <= 0;
		addr_a <= addr_a + 1;
	end
	else if(cnt >= tmp)
	begin
		//cnt <= 0;
		cnt <= cnt + 1;
		signal <= 0;
	end
	else if(en == 1)
		cnt <= cnt + 1;
end
endmodule
