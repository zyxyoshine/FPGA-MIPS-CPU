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
	input [WIDTH-1:0] ext5_inmux10, //输入数据，数据宽度可以根据需要自行定义
	input ext5_s, //sext 有效为符号扩展，否则 0 扩展
	output[31:0]  ext5_outmux4,//32 位输出数据，
	output[31:0]  ext5_outmux6//32 位输出数据，
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
