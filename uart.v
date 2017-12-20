`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/16 18:19:28
// Design Name: 
// Module Name: uart
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


module uart(
    input clk, 
		input rst_n,
		input	UART_RX,
		output reg [7:0] recv,
		output reg [11:0] read,
		//output integer cnt,
		//output reg [1:0] state,
		//output reg en,
		//output reg [3:0] bit,
		//output reg [2:0] i,
		//output reg [2:0] bgn,
		//output reg [23:0] tmp,
		output reg wen_c,
		output reg addr_c
    );
		localparam bps = 50000000 / 9600 / 2;
		localparam IDLE = 2'b00;
		localparam RECV = 2'b01;
		localparam END = 2'b10;
		reg [7:0] data;
		reg [1:0] state;
		reg [23:0] tmp;
		integer cnt;
		reg [3:0] bit;
		reg en;
		reg [2:0] bgn;
		reg [2:0] i;
		//assign wen_c = 0;
		always@(posedge clk or negedge rst_n)
		begin
			if(~rst_n)
			begin
				en <= 0;
				cnt <= 0;
			end
			else if(cnt >= bps)
			begin
				en <= ~en;
				cnt <= 0;
			end
			else
				cnt <= cnt + 1;
		end
		always@(posedge en or negedge rst_n)
		begin
			if(~rst_n)
			begin
				state <= IDLE;
				data <= 0;
				tmp <= 0;
			end
			else if(state == IDLE)
			begin
				//state <= state + ~UART_RX;
				state <= UART_RX ? IDLE:RECV;
				bit <= 0;
				data <= 0;
			end
			else if(state == RECV)
			begin
				//state <= state + (bit==7)? 1:0;
				state <= (bit == 7) ? END:RECV;
				data <= {UART_RX, data[7:1]};
				bit <= bit + 1;
			end
			else if(state == END)
			begin
				//wen <= 1;
				recv <= data;
				state <= IDLE;
				i <= (i==3) ? 0:i + 1;
				tmp <= {tmp[15:0], data};
			end
		end
		always@(posedge clk or negedge rst_n)
		begin
			if(~rst_n)
			begin
				wen_c <= 0;
				addr_c <= 0;
				bgn <= 0;
			end
			else if(i == 3)
			begin
				if(bgn >= 3)
					wen_c <= 0;
				else if(bgn > 0)
				begin
					read <= (bgn==1) ? tmp[23:12]:tmp[11:0];
					wen_c <= 1;
					addr_c <= addr_c + 1;
					bgn <= bgn + 1;
				end
				else
					bgn <= bgn + 1;
			end
			else
			bgn <= 0;
		end
endmodule
