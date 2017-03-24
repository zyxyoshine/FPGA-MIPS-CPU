`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:26:08 06/05/2016 
// Design Name: 
// Module Name:    Imem 
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
module Imem(
	input [31:0] imem_inaddr, // 输入地址，指定数据读写的地址
	output [31:0] imem_outcontrol,
	output [4:0]  imem_outmux10,  // 存储器读出的数据，工作时持续输出相应地址的数据
	output [15:0] imem_outext16,
	output [17:0] imem_outext18,
	output [27:0] imem_outcombin,
	output [5:0] imem_outinsdec31_26,
	output [5:0] imem_outinsdec5_0
	);

	//reg [31:0] IMEM[0:2048];
	
	wire [31:0] INS;
	wire [10:0] addr = {imem_inaddr[12:2]};
	ip_imem _ip_imem(.a(addr),.spo(INS));
	assign imem_outcontrol = INS;
	assign imem_outmux10 = {INS[10:6]};
	assign imem_outext16 = {INS[15:0]};
	assign imem_outext18 = {INS[15:0],2'b00};
	assign imem_outcombin = {INS[25:0],2'b00};
	assign imem_outinsdec31_26 = {INS[31:26]};
	assign imem_outinsdec5_0 = {INS[5:0]};
	
	/*
	assign imem_outcontrol = IMEM[imem_inaddr[31:2]];
	assign imem_outmux10   = {IMEM[imem_inaddr[31:2]][10:6]};
	assign imem_outext16   = {IMEM[imem_inaddr[31:2]][15:0]};
	assign imem_outext18   = {IMEM[imem_inaddr[31:2]][15:0], 2'b00};
	assign imem_outcombin   = {IMEM[imem_inaddr[31:2]][25:0], 2'b00};
	assign imem_outinsdec31_26  = {IMEM[imem_inaddr[31:2]][31:26]};
	assign imem_outinsdec5_0 = {IMEM[imem_inaddr[31:2]][5:0]};


	initial begin
		$readmemh("6.txt", IMEM);
	end
	*/
endmodule

