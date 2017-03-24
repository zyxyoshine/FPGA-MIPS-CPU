`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:55:11 06/01/2016 
// Design Name: 
// Module Name:    Pc 
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
module Pc(
	input clk,
	input rst,
	input [31:0]  pc_inmux3,
	output [31:0] pc_outimem,
	output [31:0] pc_outnpc,
	output [31:0] pc_outmux5,
	output [3:0]  pc_outcombin,
	output [31:0] pc_outadd
	);

	reg [31:0] tpc_outimem;
	reg [31:0] tpc_outnpc;
	reg [31:0] tpc_outmux5;
	reg [3:0]  tpc_outcombin;
	reg [31:0] tpc_outadd;

	assign pc_outimem = tpc_outimem;
	assign pc_outnpc = tpc_outnpc;
	assign pc_outmux5 = tpc_outmux5;
	assign pc_outcombin = tpc_outcombin;
	assign pc_outadd = tpc_outadd;
	always @(posedge clk or posedge rst) begin
		if (rst == 1) begin
			tpc_outimem  = 32'b00000000000000000000000000000000;
			tpc_outnpc   = 32'b00000000000000000000000000000000;
			tpc_outmux5  = 32'b00000000000000000000000000000000;
			tpc_outcombin = 4'b0000;
			tpc_outadd = 32'b00000000000000000000000000000000;
		end
		else begin
			tpc_outimem = pc_inmux3;
			tpc_outnpc  = pc_inmux3;
			tpc_outmux5 = pc_inmux3;
			tpc_outcombin = {pc_inmux3[31:28]};
			tpc_outadd = pc_inmux3;//+ 32'b00000000000000000000000000000100;
		end
	end
endmodule
