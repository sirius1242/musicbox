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


module model_ctl(
	input clk, rst_n, mode, 
	input [15:0] SW, [15:0] signal,
	input	inc, dec, 
	input	[2:0] band, [2:0] sel, [2:0] len,
	input [7:0] read,
	output reg electone, reg music_box, reg writing, 
	output reg [1:0] model, 
	output reg [15:0] in, 
	output reg add, redu, pre, next, 
	output reg [31:0] data,
	output reg adj
);
always@(posedge clk or negedge rst_n)
begin
	if (~rst_n)
		model <= 0;
	else if(mode)
		model <= model + 1;
end
always@(*)
begin
	case(model)
		2'b00 : 
			begin
				electone = 0;
				writing = 0;
				music_box = 1;
				adj = 1;
				in = signal;
				next = inc;
				pre = dec;
				data[2:0] = sel;
				data[15:3] = 0;
				data[31:16] = len;
			end
		2'b01 : 
			begin
				music_box = 0;
				writing = 0;
				electone = 1;
				adj = 0;
				in = SW;
				add = inc;
				redu = dec;
				data[31:3] = 0;
				data[2:0] = band;
			end
		2'b10 :
			begin
				writing = 1;
				music_box = 0;
				electone = 0;
				in = signal;
				data[31:8] = 0;
				data[7:0] = read;
			end
		2'b11 : 
			begin
				writing = 1;
				music_box = 1;
				electone = 0;
				data = 0;
			end
	endcase
end
endmodule
module top(
    input [15:0] SW,
    input rst_n, clk, left, right, play,
		input mode,
		input UART_RX,
    output bell,
		output [15:0] LED,
		output en,
		output electone,
		output writing,
		output music_box,
		output [2:0] sel,
		output [6:0] segment,
		output en_2,
		output uart_test
    );
		wire [2:0] band;
		wire [2:0] bandi;
		wire [1:0] model;
		wire mode_chg;
		wire adj;
		assign uart_test = UART_RX;
		wire [15:0] in;
		wire [2:0] len;
		wire [15:0] signal;
		wire [15:0] addr_a, addr_b, addr_c;
		wire [15:0] addr;
		wire [11:0] data_c;
		wire [31:0] data;
		wire [7:0] read;
		wire [11:0] q_a, q_b;
		wire wen_c;
		wire pause, dec, inc, add, redu, pre, next;
		wire [2:0] sel_2;
		assign LED = in;
		no_fitter fit1(play, rst_n, clk, pause);
		no_fitter fit2(left, rst_n, clk, dec);
		no_fitter fit3(right, rst_n, clk, inc);
		no_fitter fit4(mode, rst_n, clk, mode_chg);
		model_ctl model_test(clk, rst_n, mode_chg, SW, signal, inc, dec, band, sel_2, len, read, electone, music_box, writing, model, in, add, redu, pre, next, data, adj);
		regfile reg1(clk, rst_n, addr_a, addr_b,  addr_c, data_c, wen_c, sel_2, q_a, q_b, len, addr);
		read read_box(q_a, clk, rst_n, addr, pause, pre, next, 3'b011, signal, bandi, addr_a, en_2, sel_2);
		musicbox test(in, rst_n, pause, clk, redu, add, adj, bandi, bell, en, band);
		//musicbox test(in, rst_n, pause, clk, dec, inc, adj, bandi, bell, LED, en, band);
		seg seg1(clk, rst_n, data, sel, segment);
		uart recv(clk, rst_n, UART_RX, read, data_c, wen_c, addr_c);
		//uart recv(clk, rst_n, UART_RX, read);
		endmodule
