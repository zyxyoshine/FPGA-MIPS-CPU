`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:57:25 06/02/2016 
// Design Name: 
// Module Name:    Combin 
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
module Combin(
	input  [3:0]  combin_inpc,
	input  [27:0] combin_inimem,
	output [31:0] combin_outmux2
	);

	assign combin_outmux2 = {combin_inpc[3:0], combin_inimem[27:0]};

endmodule
