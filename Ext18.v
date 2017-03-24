`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:03:30 06/03/2016 
// Design Name: 
// Module Name:    Ext18 
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
module Ext18 #(parameter WIDTH = 18)(
	input [WIDTH-1:0] ext18_inimem, //输入数据，数据宽度可以根据需要自行定义
	input ext18_s, //sext 有效为符号扩展，否则 0 扩展
	output[31:0] ext18_outadd //32 位输出数据，
	);

	reg [31:0] ext18_outadd_temp;
	integer I;
	assign ext18_outadd = ext18_outadd_temp;

	always @(ext18_s or ext18_inimem) begin
		for (I = 31; I >= WIDTH; I = I-1) begin
			if (ext18_s == 1)
				ext18_outadd_temp[I] = ext18_inimem[WIDTH-1];
			else
				ext18_outadd_temp[I] = 0;
		end

		for (I = WIDTH-1; I >= 0; I = I-1)
			ext18_outadd_temp[I] = ext18_inimem[I];
	end

endmodule
