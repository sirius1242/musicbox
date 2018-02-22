`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/07 15:05:49
// Design Name: 
// Module Name: musicbox
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


module musicbox(
	input [15:0] SW,
	input rst_n, pause, clk, left, right,
	input adj, [2:0]bandi,
	output reg bell,
	//output [15:0] LED,
	output reg en,
	output reg [2:0] band
);
localparam pitch0 = 50000000/3729;
localparam pitch1 = 50000000/3951;
localparam pitch2 = 50000000/4186;
localparam pitch3 = 50000000/4434;
localparam pitch4 = 50000000/4698;
localparam pitch5 = 50000000/4978;
localparam pitch6 = 50000000/5274;
localparam pitch7 = 50000000/5587;
localparam pitch8 = 50000000/5919;
localparam pitch9 = 50000000/6271;
localparam pitch10 = 50000000/6644;
localparam pitch11 = 50000000/7040;
localparam pitch12 = 50000000/7458;
localparam pitch13 = 50000000/7902;
localparam pitch14 = 50000000/8372;
localparam pitch15 = 50000000/8869;
integer tmp, cnt;
//assign LED = tmp[31:16];
wire [8:0] factor;
assign factor = 2 ** band;
always@(posedge clk or negedge rst_n)
begin
	if(~rst_n)
	begin
		cnt <= 0;
		bell <= 0;
		en <= 0;
		band <= 3'h4;
	end
	else if(pause)
		en <= ~en;
	else if(left)
		band <= band - 1;
	else if(right)
		band <= band + 1;
	else if(cnt == 0)
	begin
		if(adj)
		begin
			band = bandi;
		end
		case(SW)
			16'h0001: tmp <= factor * pitch0;
			16'h0002: tmp <= factor * pitch1;
			16'h0004: tmp <= factor * pitch2;
			16'h0008: tmp <= factor * pitch3;
			16'h0010: tmp <= factor * pitch4;
			16'h0020: tmp <= factor * pitch5;
			16'h0040: tmp <= factor * pitch6;
			16'h0080: tmp <= factor * pitch7;
			16'h0100: tmp <= factor * pitch8;
			16'h0200: tmp <= factor * pitch9;
			16'h0400: tmp <= factor * pitch10;
			16'h0800: tmp <= factor * pitch11;
			16'h1000: tmp <= factor * pitch12;
			16'h2000: tmp <= factor * pitch13;
			16'h4000: tmp <= factor * pitch14;
			16'h8000: tmp <= factor * pitch15;
			default: tmp <= 0;
		endcase
		cnt <= cnt+1;
	end
	else if(tmp == 0)
		cnt <= 0;
	else if(cnt >= tmp)
	begin
		cnt <= 0;
		bell <= ~bell;
	end
	else if(en == 1)
		cnt <= cnt+1;
end
endmodule
