`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/07 19:22:39
// Design Name: 
// Module Name: seg
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


module encode(
	input wire [3:0] tmp,
	output reg [6:0] segment
);
always@(*)
begin
	case (tmp)
		0:  segment = 7'b100_0000;
		1:  segment = 7'b111_1001;
		2:  segment = 7'b010_0100;
		3:  segment = 7'b011_0000;
		4:  segment = 7'b001_1001;
		5:  segment = 7'b001_0010;
		6:  segment = 7'b000_0010;
		7:  segment = 7'b111_1000;
		8:  segment = 7'b000_0000;
		9:  segment = 7'b001_0000; 
		10:  segment = 7'b000_1000;
		11:  segment = 7'b000_0011;
		12:  segment = 7'b100_0110;
		13:  segment = 7'b010_0001;
		14:  segment = 7'b000_0110;
		15:  segment = 7'b000_1110;
		default:  segment = 7'b000_0000;
	endcase
end
endmodule
module seg(
	input clk, 
	input rst_n, 
	input [31:0] q_a,
	output reg [2:0] sel,
	output wire [6:0] segment
	);
	localparam mili = 50_000_00 / 1000;
	reg [15:0] cnt;
	reg en;
	reg [3:0] tmp;
	initial sel = 3'b000;
	encode encode1(tmp,segment);
	always@(posedge clk or negedge rst_n)
	begin
		if (~rst_n)
			cnt <= 16'h0000;
		else if(cnt == mili)
		cnt = 16'h0000;
		else if (cnt == mili-1)
		begin
			if (sel != 3'b111)
				sel <= sel + 1;
			else
				sel <= 3'b000;
			cnt <= cnt+1;
		end
		else
			cnt <= cnt+1;
	end
	always@(*)
	begin
		case (sel)
			3'b000: tmp = q_a[3:0];
			3'b001: tmp = q_a[7:4];
			3'b010: tmp = q_a[11:8];
			3'b011: tmp = q_a[15:12];
			3'b100: tmp = q_a[19:16];
			3'b101: tmp = q_a[23:20];
			3'b110: tmp = q_a[27:24];
			3'b111: tmp = q_a[31:28];
		endcase
	end
	endmodule
