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
	input clk, // �洢��ʱ���źţ��½���ʱ�� ram �ڲ�д������
	input dmem_cs,
	input ram_r, // �洢����Ч�źţ���Чʱ�洢�������У�������� z
	input wena, // �洢��д��Ч�źţ��� ram_ena ͬʱ��Чʱ�ſ�д�洢��
	input [31:0] ram_inaddr, // �����ַ��ָ�����ݶ�д�ĵ�ַ
	input [31:0] data_in, // �洢��д������ݣ��� clk ������ʱ��д��
	output [31:0] data_out  // �洢�����������ݣ�ram ����ʱ���������Ӧ��ַ������
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
