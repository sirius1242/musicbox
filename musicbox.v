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
	input rst_n, clk, left, right,
	output reg bell,
	output [15:0] LED,
	output reg en,
	output reg [2:0] band
);
localparam pitch0 = 50000000/1865;
localparam pitch1 = 50000000/1976;
localparam pitch2 = 50000000/2093;
localparam pitch3 = 50000000/2217;
localparam pitch4 = 50000000/2349;
localparam pitch5 = 50000000/2489;
localparam pitch6 = 50000000/2637;
localparam pitch7 = 50000000/2794;
localparam pitch8 = 50000000/2960;
localparam pitch9 = 50000000/3136;
localparam pitch10 = 50000000/3322;
localparam pitch11 = 50000000/3520;
localparam pitch12 = 50000000/3729;
localparam pitch13 = 50000000/3951;
localparam pitch14 = 50000000/4186;
localparam pitch15 = 50000000/4434;
integer tmp, cnt;
assign LED = tmp[23:8];
wire [4:0] factor;
assign factor = 2 ** band;
always@(posedge clk or negedge rst_n or negedge left or negedge right)
begin
	if(~rst_n)
	begin
		cnt <= 0;
		bell <= 0;
		en <= ~en;
		band <= 8'h2;
	end
	else if(~left)
	begin
		cnt <= 0;
		bell <= 0;
		band <= band - 1;
	end
	else if(~right)
	begin
		cnt <= 0;
		bell <= 0;
		band <= band + 1;
	end
	else if(cnt == 0)
	begin
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
