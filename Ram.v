`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:00:26 06/05/2016 
// Design Name: 
// Module Name:    Ram 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Ram(
	input clk100mhz,
   input ps2_clk,
   input ps2_data,
	input clk, // 存储器时钟信号，下降沿时向 ram 内部写入数据
	input dmem_cs,
	input ram_r, // 存储器有效信号，有效时存储器才运行，否则输出 z
	input wena, // 存储器写有效信号，与 ram_ena 同时有效时才可写存储器
	input [31:0] ram_inaddr, // 输入地址，指定数据读写的地址
	input [31:0] data_in, // 存储器写入的数据，在 clk 上升沿时被写入
	output [31:0] data_out  // 存储器读出的数据，ram 工作时持续输出相应地址的数据
	);

	reg [31:0] _RAM[0:1023];
	//assign data_out = ((dmem_cs&ram_r)?_RAM[ram_inaddr[11:2]]:32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz);
	wire [31:0] kb_out;
	
	keyboard keyb(.clk(clk100mhz), .ps2_clk(ps2_clk), .ps2_data(ps2_data), .keyb_char(kb_out));
	
	assign data_out = ( (ram_inaddr[15:12] == 4'h1 )? kb_out
																	:(dmem_cs&ram_r) ? _RAM[ram_inaddr[11:2]]
																	:32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz);
	always @(posedge clk) begin//
		if (dmem_cs == 1) begin
			if (wena == 1)
				_RAM[ram_inaddr[11:2]] = data_in;//
			else
				_RAM[ram_inaddr[11:2]] = _RAM[ram_inaddr[11:2]];//
		end
		else begin
		end
	end
endmodule
