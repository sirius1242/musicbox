`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/02/07 14:11:51
// Design Name: 
// Module Name: metronome
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


module metronome(
		input [7:0] speed,
		input	clk,
		input	rst_n,
		input [15:0] SW,
		output reg bell,
		output reg [15:0] LED,
		output reg en
    );
		localparam freq = 2500;
		localparam beat = 25000000 / freq;
		localparam delta = 60 * freq / 256 / 16;
		//localparam beat = 25000000 / 2093;
		//localparam beat = 250000 / 2093;
		wire[31:0] blank;
	 	assign blank = 60 * freq / speed / 16;
		integer i;
		integer j;
		reg [3:0] k;
		reg sign;
		//assign green = en == 1 ? 1:0;
		always@(posedge clk or negedge rst_n)
		begin
			if (~rst_n)
			begin
				j <= 0;
				sign <= 0;
			end
			else if(SW == 16'h0000)
			begin
				j <= j;
				en <= 0;
			end
			else if(j >= beat)
			begin
				sign <= ~sign;
				en <= 1;
				j <= 0;
			end
			else
				j <= j+1;
		end
		always@(posedge sign or negedge rst_n)
		begin
			if (~rst_n)
			begin
				i <= 0;
				bell <= 0;
				k <= 0;
				LED <= 0;
			end
			else if(i >= blank)
			begin
				i <= 0;
				LED[k] <= 1;
				LED[k == 0 ? 15 : k-1] <= 0;
				k <= k+1;
			end
			else if(SW[k] === 0)
				i <= i+1;
			else if(i >= blank - delta)
			begin
				bell <= ~bell;
				i <= i+1;
			end
			else
				i <= i+1;
		end
endmodule


module freq(
		input clk, left, right, up, rst_n,
		output reg [7:0] speed
		);
		always@(posedge clk or negedge rst_n)
		begin
			if(~rst_n)
				speed <= 60;
			else if(left)
				speed <= speed - 1;
			else if(right)
				speed <= speed + 1;
			else if(up)
				speed <= speed + 10;
		end
endmodule
