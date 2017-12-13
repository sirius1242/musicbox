`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/16 18:19:28
// Design Name: 
// Module Name: recv
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


module recv(
    input clk,
    input rst_n,
		input UART_RX,
		output reg [11:0] read,
		output reg wen_c,
		output reg addr_c
    );
		localparam bps = 50000000 / 9600;
		integer cnt;
		reg [4:0] bit;
		reg en;
		reg flag;
		always@(posedge clk or negedge rst_n)
		begin
			if (~rst_n)
			begin
				cnt <= 0;
				bit <= 0;
				wen_c <= 0;
				read <= 0;
				addr_c <= 0;
			end
			else if(~en)
				en <= ~UART_RX;
			else if(bit == 11)
			begin
				flag <= 1;
				//wen_c <= 1;
				addr_c <= addr_c + 1;
			end
			else if(flag == 1)
			begin
				wen_c <= 0;
				read <= 0;
			end
			else if(cnt >= bps)
			begin
				cnt <= 0;
				bit <= bit + 1;
				read[bit] <= UART_RX;
			end
		end
endmodule
