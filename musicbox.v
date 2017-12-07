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
	input rst_n, clk,
	output reg bell,
	output [15:0] LED
);
localparam pitch0 = 50000000/415.3;
localparam pitch1 = 50000000/440;
localparam pitch2 = 50000000/466.2;
localparam pitch3 = 50000000/493.9;
localparam pitch4 = 50000000/523.3;
localparam pitch5 = 50000000/554.4;
localparam pitch6 = 50000000/587.3;
localparam pitch7 = 50000000/622.3;
localparam pitch8 = 50000000/659.3;
localparam pitch9 = 50000000/698.5;
localparam pitch10 = 50000000/740.0;
localparam pitch11 = 50000000/784.0;
localparam pitch12 = 50000000/830.6;
localparam pitch13 = 50000000/880;
localparam pitch14 = 50000000/1047;
localparam pitch15 = 50000000/1109;
integer tmp, cnt;
reg en;
assign LED = tmp[23:8];
always@(posedge clk or negedge rst_n)
begin
	if(~rst_n)
	begin
		cnt <= 0;
		bell <= 0;
		en <= ~en;
	end
	else if(cnt === 0)
	begin
		case(SW)
			16'h0001: tmp <= pitch0;
			16'h0002: tmp <= pitch1;
			16'h0004: tmp <= pitch2;
			16'h0008: tmp <= pitch3;
			16'h0010: tmp <= pitch4;
			16'h0020: tmp <= pitch5;
			16'h0040: tmp <= pitch6;
			16'h0080: tmp <= pitch7;
			16'h0100: tmp <= pitch8;
			16'h0200: tmp <= pitch9;
			16'h0400: tmp <= pitch10;
			16'h0800: tmp <= pitch11;
			16'h1000: tmp <= pitch12;
			16'h2000: tmp <= pitch13;
			16'h4000: tmp <= pitch14;
			16'h8000: tmp <= pitch15;
			default: en <= 0;
		endcase
		cnt <= cnt+1;
	end
	else if(cnt >= tmp)
	begin
		cnt <= 0;
		bell <= ~bell;
	end
	else if(en == 1)
		cnt <= cnt+1;
end
endmodule
