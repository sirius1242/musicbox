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
	input clk, rst_n, mode, [15:0] SW, [15:0] signal,
	output reg electone, reg music_box, reg writing, reg [1:0] model, reg [15:0] in
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
				in = signal;
			end
		2'b01 : 
			begin
				music_box = 0;
				writing = 0;
				electone = 1;
				in = SW;
			end
		2'b10 : writing = 1;
	endcase
end
endmodule
module top(
    input [15:0] SW,
    input rst_n, clk, left, right, play,
		input mode,
    output bell,
		output [15:0] LED,
		output en,
		output electone,
		output writing,
		output music_box,
		output [2:0] sel,
		output [6:0] segment
    );
		wire [31:0] data;
		wire [2:0] band;
		wire [1:0] model;
		wire mode_chg;
		assign data[2:0] = band;
		wire [15:0] in;
		wire [15:0] signal;
		wire pause, dec, inc;
		no_fitter fit1(play, rst_n, clk, pause);
		no_fitter fit2(left, rst_n, clk, dec);
		no_fitter fit3(right, rst_n, clk, inc);
		no_fitter fit4(mode, rst_n, clk, mode_chg);
		model_ctl model_test(clk, rst_n, mode_chg, SW, signal, electone, music_box, writing, model, in);
		musicbox test(in, rst_n, pause, clk, dec, inc, bell, LED, en, band);
		//musicbox test(SW, rst_n, pause, clk, dec, inc, bell, LED, band);
		seg seg1(clk, rst_n, data, sel, segment);
		endmodule
