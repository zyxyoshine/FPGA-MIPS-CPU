`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:05:06 06/01/2016 
// Design Name: 
// Module Name:    Mux1 
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
module Mux1(
	input mux_in0,  // 4 位输入 a
	input mux_in1,  // 4 位输入 b
	input m,  // 1 位输入，当 s=0 时 r 的值等于 a，s=1 时 r 的值等于 b
	output mux_out// 4 位输出，相应位的值由 a b s 的值确定
	);

	reg mux_out_temp;
	assign mux_out = mux_out_temp;

	always @(mux_in0 or mux_in1 or m) begin
		if (m == 0)
			mux_out_temp = mux_in0;
		else
			mux_out_temp = mux_in1;
	end

endmodule
