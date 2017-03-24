`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:51:18 06/01/2016 
// Design Name: 
// Module Name:    Npc 
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
module Npc(
	input [31:0] npc_inpc,
	output [31:0] npc_outpc
	//output [31:0] npc_outadd
	);

	assign npc_outpc  = npc_inpc + 4;
	//assign npc_outadd = npc_inpc + 4;

endmodule
