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
		//output reg [3:0] bit
		output reg wen_c,
		output reg addr_c
    );
		localparam bps = 50000000 / 9600 / 2;
		localparam IDLE = 2'b00;
		localparam RECV = 2'b01;
		localparam END = 2'b10;
		reg [7:0] data;
		reg [1:0] state;
		reg [31:0] out;
		reg two;
		reg bits;
		integer cnt;
		reg [3:0] bit;
		reg en;
		reg [1:0] half;
		//assign wen_c = 0;
		always@(posedge clk or negedge rst_n)
		begin
			if(~rst_n)
			begin
				en <= 0;
				cnt <= 0;
				addr_c <= 0;
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
				bits <= 0;
			end
			else if(state == IDLE)
			begin
				//state <= state + ~UART_RX;
				state <= UART_RX ? IDLE:RECV;
				bit <= 0;
				data <= 0;
				bits <= 0;
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
				recv <= data;
				state <= IDLE;
				half <= (half == 3) ? 0:half + 1;
				bits <= 1;
			end
		end
		always@(posedge clk)
		begin
			begin
				case(half)
					0: out <= { recv, 16'h0000};
					1: out <= { out[23:16], recv, 8'h00};
					2: 
						begin
							out <= { out[23:8], recv};
							read <= out[23:12];
							wen_c <= 1;
							two <= 1;
							addr_c <= addr_c + 1;
						end
					endcase
				end
				else if(two)
				begin
					read <= out[11:0];
					two <= 0;
					addr_c <= addr_c + 1;
				end
				else
					wen_c <= 0;
			end
			always@(posedge bits or negedge bits)
			begin
				if(bits)
					bgn <= 0;
				else
					bgn <= 1;
			end
			endmodule
