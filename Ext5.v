`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:01:39 06/03/2016 
// Design Name: 
// Module Name:    Ext5 
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
module Ext5 #(parameter WIDTH = 5)(
	input [WIDTH-1:0] ext5_inmux10, //�������ݣ����ݿ�ȿ��Ը�����Ҫ���ж���
	input ext5_s, //sext ��ЧΪ������չ������ 0 ��չ
	output[31:0]  ext5_outmux4,//32 λ������ݣ�
	output[31:0]  ext5_outmux6//32 λ������ݣ�
	);

	reg [31:0] ext5_outmux_temp;
	integer I;
	assign ext5_outmux4 = ext5_outmux_temp;
	assign ext5_outmux6 = ext5_outmux_temp;

	always @(ext5_s or ext5_inmux10) begin
		for (I = 31; I >= WIDTH; I = I-1) begin
			if (ext5_s == 1)
				ext5_outmux_temp[I] = ext5_inmux10[WIDTH-1];
			else
				ext5_outmux_temp[I] = 0;
		end

		for (I = WIDTH-1; I >= 0; I = I-1)
			ext5_outmux_temp[I] = ext5_inmux10[I];
	end

endmodule
