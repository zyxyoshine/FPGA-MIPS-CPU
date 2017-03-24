`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:02:56 06/03/2016 
// Design Name: 
// Module Name:    Ext16 
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
module Ext16 #(parameter WIDTH = 16)(
	input [WIDTH-1:0] ext16_inimem, //�������ݣ����ݿ�ȿ��Ը�����Ҫ���ж���
	input ext16_s, //sext ��ЧΪ������չ������ 0 ��չ
	output[31:0] ext16_outmux5, //32 λ������ݣ�
	output[31:0] ext16_outmux7
	);

	reg [31:0] ext16_out_temp;
	integer I;
	assign ext16_outmux5 = ext16_out_temp;
	assign ext16_outmux7 = ext16_out_temp;

	always @(ext16_s or ext16_inimem) begin
		for (I = 31; I >= WIDTH; I = I-1) begin
			if (ext16_s == 1)
				ext16_out_temp[I] = ext16_inimem[WIDTH-1];
			else
				ext16_out_temp[I] = 0;
		end

		for (I = WIDTH-1; I >= 0; I = I-1)
			ext16_out_temp[I] = ext16_inimem[I];
	end

endmodule
