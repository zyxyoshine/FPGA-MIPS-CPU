`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:54:03 06/01/2016 
// Design Name: 
// Module Name:    Regfiles 
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
module Regfiles(
			input  clk, //寄存器组时钟信号，下降沿写入数据（注意：pc 为上升沿， 此为下降沿）
			input  rst, //reset 信号，reset 有效时全部寄存器置零
			input  we,  //写有效信号，we 有效时寄存器才能被写入
			input  [4:0]  regfiles_inRsc, //所需读取的寄存器的地址
			input  [4:0]  regfiles_inRtc, //所需读取的寄存器的地址
			input  [4:0]  waddr,  //写寄存器的地址
			input  [31:0] wdata,  //写寄存器数据
			output [31:0] regfiles_outmux2, //raddr1 所对应寄存器的数据，只要有 raddr1 的输入即输出 相应数据
			output [31:0] regfiles_outmux4, //raddr1 所对应寄存器的数据，只要有 raddr1 的输入即输出 相应数据
			output [31:0] regfiles_outmux6, //raddr2 所对应寄存器的数据，只要有 raddr2 的输入即输出 相应数据
			output [31:0] regfiles_outdmem, //raddr2 所对应寄存器的数据，只要有 raddr2 的输入即输出 相应数据
			output [31:0] shuma
		);

		wire [31:0] waddr_32;
		wire [31:0] rdata[0:31];
		
		assign shuma = rdata[17];
		
		regfiles_decoder _dregfiles_ecoder(.data_in(waddr), .ena(we), .data_out(waddr_32));
		regfiles_pcreg   r0 (.clk(clk), .rst(rst), .ena(waddr_32[0]),  .data_in(wdata), .data_out(rdata[0]));
		regfiles_pcreg   r1 (.clk(clk), .rst(rst), .ena(waddr_32[1]),  .data_in(wdata), .data_out(rdata[1]));
		regfiles_pcreg   r2 (.clk(clk), .rst(rst), .ena(waddr_32[2]),  .data_in(wdata), .data_out(rdata[2]));
		regfiles_pcreg   r3 (.clk(clk), .rst(rst), .ena(waddr_32[3]),  .data_in(wdata), .data_out(rdata[3]));
		regfiles_pcreg   r4 (.clk(clk), .rst(rst), .ena(waddr_32[4]),  .data_in(wdata), .data_out(rdata[4]));
		regfiles_pcreg   r5 (.clk(clk), .rst(rst), .ena(waddr_32[5]),  .data_in(wdata), .data_out(rdata[5]));
		regfiles_pcreg   r6 (.clk(clk), .rst(rst), .ena(waddr_32[6]),  .data_in(wdata), .data_out(rdata[6]));
		regfiles_pcreg   r7 (.clk(clk), .rst(rst), .ena(waddr_32[7]),  .data_in(wdata), .data_out(rdata[7]));
		regfiles_pcreg   r8 (.clk(clk), .rst(rst), .ena(waddr_32[8]),  .data_in(wdata), .data_out(rdata[8]));
		regfiles_pcreg   r9 (.clk(clk), .rst(rst), .ena(waddr_32[9]),  .data_in(wdata), .data_out(rdata[9]));
		regfiles_pcreg   r10(.clk(clk), .rst(rst), .ena(waddr_32[10]), .data_in(wdata), .data_out(rdata[10]));
		regfiles_pcreg   r11(.clk(clk), .rst(rst), .ena(waddr_32[11]), .data_in(wdata), .data_out(rdata[11]));
		regfiles_pcreg   r12(.clk(clk), .rst(rst), .ena(waddr_32[12]), .data_in(wdata), .data_out(rdata[12]));
		regfiles_pcreg   r13(.clk(clk), .rst(rst), .ena(waddr_32[13]), .data_in(wdata), .data_out(rdata[13]));
		regfiles_pcreg   r14(.clk(clk), .rst(rst), .ena(waddr_32[14]), .data_in(wdata), .data_out(rdata[14]));
		regfiles_pcreg   r15(.clk(clk), .rst(rst), .ena(waddr_32[15]), .data_in(wdata), .data_out(rdata[15]));
		regfiles_pcreg   r16(.clk(clk), .rst(rst), .ena(waddr_32[16]), .data_in(wdata), .data_out(rdata[16]));
		regfiles_pcreg   r17(.clk(clk), .rst(rst), .ena(waddr_32[17]), .data_in(wdata), .data_out(rdata[17]));
		regfiles_pcreg   r18(.clk(clk), .rst(rst), .ena(waddr_32[18]), .data_in(wdata), .data_out(rdata[18]));
		regfiles_pcreg   r19(.clk(clk), .rst(rst), .ena(waddr_32[19]), .data_in(wdata), .data_out(rdata[19]));
		regfiles_pcreg   r20(.clk(clk), .rst(rst), .ena(waddr_32[20]), .data_in(wdata), .data_out(rdata[20]));
		regfiles_pcreg   r21(.clk(clk), .rst(rst), .ena(waddr_32[21]), .data_in(wdata), .data_out(rdata[21]));
		regfiles_pcreg   r22(.clk(clk), .rst(rst), .ena(waddr_32[22]), .data_in(wdata), .data_out(rdata[22]));
		regfiles_pcreg   r23(.clk(clk), .rst(rst), .ena(waddr_32[23]), .data_in(wdata), .data_out(rdata[23]));
		regfiles_pcreg   r24(.clk(clk), .rst(rst), .ena(waddr_32[24]), .data_in(wdata), .data_out(rdata[24]));
		regfiles_pcreg   r25(.clk(clk), .rst(rst), .ena(waddr_32[25]), .data_in(wdata), .data_out(rdata[25]));
		regfiles_pcreg   r26(.clk(clk), .rst(rst), .ena(waddr_32[26]), .data_in(wdata), .data_out(rdata[26]));
		regfiles_pcreg   r27(.clk(clk), .rst(rst), .ena(waddr_32[27]), .data_in(wdata), .data_out(rdata[27]));
		regfiles_pcreg   r28(.clk(clk), .rst(rst), .ena(waddr_32[28]), .data_in(wdata), .data_out(rdata[28]));
		regfiles_pcreg   r29(.clk(clk), .rst(rst), .ena(waddr_32[29]), .data_in(wdata), .data_out(rdata[29]));
		regfiles_pcreg   r30(.clk(clk), .rst(rst), .ena(waddr_32[30]), .data_in(wdata), .data_out(rdata[30]));
		regfiles_pcreg   r31(.clk(clk), .rst(rst), .ena(waddr_32[31]), .data_in(wdata), .data_out(rdata[31]));
		regfiles_mux     _regfiles_mux1(.data0(rdata[0]), .data1(rdata[1]), .data2(rdata[2]), .data3(rdata[3]), .data4(rdata[4]), .data5(rdata[5]), .data6(rdata[6]), .data7(rdata[7]), .data8(rdata[8]), .data9(rdata[9]), .data10(rdata[10]), .data11(rdata[11]), .data12(rdata[12]), .data13(rdata[13]), .data14(rdata[14]), .data15(rdata[15]), .data16(rdata[16]), .data17(rdata[17]), .data18(rdata[18]), .data19(rdata[19]), .data20(rdata[20]), .data21(rdata[21]), .data22(rdata[22]), .data23(rdata[23]), .data24(rdata[24]), .data25(rdata[25]), .data26(rdata[26]), .data27(rdata[27]), .data28(rdata[28]), .data29(rdata[29]), .data30(rdata[30]), .data31(rdata[31]), .s(regfiles_inRsc), .r1(regfiles_outmux2), .r2(regfiles_outmux4));
		regfiles_mux     _regfiles_mux2(.data0(rdata[0]), .data1(rdata[1]), .data2(rdata[2]), .data3(rdata[3]), .data4(rdata[4]), .data5(rdata[5]), .data6(rdata[6]), .data7(rdata[7]), .data8(rdata[8]), .data9(rdata[9]), .data10(rdata[10]), .data11(rdata[11]), .data12(rdata[12]), .data13(rdata[13]), .data14(rdata[14]), .data15(rdata[15]), .data16(rdata[16]), .data17(rdata[17]), .data18(rdata[18]), .data19(rdata[19]), .data20(rdata[20]), .data21(rdata[21]), .data22(rdata[22]), .data23(rdata[23]), .data24(rdata[24]), .data25(rdata[25]), .data26(rdata[26]), .data27(rdata[27]), .data28(rdata[28]), .data29(rdata[29]), .data30(rdata[30]), .data31(rdata[31]), .s(regfiles_inRtc), .r1(regfiles_outmux6), .r2(regfiles_outdmem));

endmodule

module regfiles_decoder(
    input  [4:0] data_in, //写寄存器的地址
    input  ena,
    output [31:0] data_out
    );

	 reg [31:0] data_temp;
	 assign data_out = data_temp;

	 always @(ena or data_in) begin
		if (ena == 1)
			case (data_in)
				5'b00000:
					data_temp = 32'b11111111111111111111111111111111;
				5'b00001:
					data_temp = 32'b11111111111111111111111111111101;
				5'b00010:
					data_temp = 32'b11111111111111111111111111111011;
				5'b00011:
					data_temp = 32'b11111111111111111111111111110111;
				5'b00100:
					data_temp = 32'b11111111111111111111111111101111;
				5'b00101:
					data_temp = 32'b11111111111111111111111111011111;
				5'b00110:
					data_temp = 32'b11111111111111111111111110111111;
				5'b00111:
					data_temp = 32'b11111111111111111111111101111111;
				5'b01000:
					data_temp = 32'b11111111111111111111111011111111;
				5'b01001:
					data_temp = 32'b11111111111111111111110111111111;
				5'b01010:
					data_temp = 32'b11111111111111111111101111111111;
				5'b01011:
					data_temp = 32'b11111111111111111111011111111111;
				5'b01100:
					data_temp = 32'b11111111111111111110111111111111;
				5'b01101:
					data_temp = 32'b11111111111111111101111111111111;
				5'b01110:
					data_temp = 32'b11111111111111111011111111111111;
				5'b01111:
					data_temp = 32'b11111111111111110111111111111111;
				5'b10000:
					data_temp = 32'b11111111111111101111111111111111;
				5'b10001:
					data_temp = 32'b11111111111111011111111111111111;
				5'b10010:
					data_temp = 32'b11111111111110111111111111111111;
				5'b10011:
					data_temp = 32'b11111111111101111111111111111111;
				5'b10100:
					data_temp = 32'b11111111111011111111111111111111;
				5'b10101:
					data_temp = 32'b11111111110111111111111111111111;
				5'b10110:
					data_temp = 32'b11111111101111111111111111111111;
				5'b10111:
					data_temp = 32'b11111111011111111111111111111111;
				5'b11000:
					data_temp = 32'b11111110111111111111111111111111;
				5'b11001:
					data_temp = 32'b11111101111111111111111111111111;
				5'b11010:
					data_temp = 32'b11111011111111111111111111111111;
				5'b11011:
					data_temp = 32'b11110111111111111111111111111111;
				5'b11100:
					data_temp = 32'b11101111111111111111111111111111;
				5'b11101:
					data_temp = 32'b11011111111111111111111111111111;
				5'b11110:
					data_temp = 32'b10111111111111111111111111111111;
				5'b11111:
					data_temp = 32'b01111111111111111111111111111111;
				default:
					data_temp = 32'b11111111111111111111111111111111;
			endcase
		else
			data_temp = 32'b11111111111111111111111111111111;
	 end
endmodule

module regfiles_mux(
	input  [31:0] data0,
	input  [31:0] data1,
	input  [31:0] data2,
	input  [31:0] data3,
	input  [31:0] data4,
	input  [31:0] data5,
	input  [31:0] data6,
	input  [31:0] data7,
	input  [31:0] data8,
	input  [31:0] data9,
	input  [31:0] data10,
	input  [31:0] data11,
	input  [31:0] data12,
	input  [31:0] data13,
	input  [31:0] data14,
	input  [31:0] data15,
	input  [31:0] data16,
	input  [31:0] data17,
	input  [31:0] data18,
	input  [31:0] data19,
	input  [31:0] data20,
	input  [31:0] data21,
	input  [31:0] data22,
	input  [31:0] data23,
	input  [31:0] data24,
	input  [31:0] data25,
	input  [31:0] data26,
	input  [31:0] data27,
	input  [31:0] data28,
	input  [31:0] data29,
	input  [31:0] data30,
	input  [31:0] data31,
	input  [4:0]  s,  // 5 位输入
	output [31:0] r1,   // 32 位输出，相应位的值由 data0-data31, s 的值确定
	output [31:0] r2   // 32 位输出，相应位的值由 data0-data31, s 的值确定
	);

	reg [31:0] r1_temp;
	reg [31:0] r2_temp;
	assign r1 = r1_temp;
	assign r2 = r2_temp;

	always @(*) begin
		case (s)
			5'b00000:
				r1_temp = data0;
			5'b00001:
				r1_temp = data1;
			5'b00010:
				r1_temp = data2;
			5'b00011:
				r1_temp = data3;
			5'b00100:
				r1_temp = data4;
			5'b00101:
				r1_temp = data5;
			5'b00110:
				r1_temp = data6;
			5'b00111:
				r1_temp = data7;
			5'b01000:
				r1_temp = data8;
			5'b01001:
				r1_temp = data9;
			5'b01010:
				r1_temp = data10;
			5'b01011:
				r1_temp = data11;
			5'b01100:
				r1_temp = data12;
			5'b01101:
				r1_temp = data13;
			5'b01110:
				r1_temp = data14;
			5'b01111:
				r1_temp = data15;
			5'b10000:
				r1_temp = data16;
			5'b10001:
				r1_temp = data17;
			5'b10010:
				r1_temp = data18;
			5'b10011:
				r1_temp = data19;
			5'b10100:
				r1_temp = data20;
			5'b10101:
				r1_temp = data21;
			5'b10110:
				r1_temp = data22;
			5'b10111:
				r1_temp = data23;
			5'b11000:
				r1_temp = data24;
			5'b11001:
				r1_temp = data25;
			5'b11010:
				r1_temp = data26;
			5'b11011:
				r1_temp = data27;
			5'b11100:
				r1_temp = data28;
			5'b11101:
				r1_temp = data29;
			5'b11110:
				r1_temp = data30;
			5'b11111:
				r1_temp = data31;
			default:
				r1_temp = r1_temp;
		endcase
		case (s)
			5'b00000:
				r2_temp = data0;
			5'b00001:
				r2_temp = data1;
			5'b00010:
				r2_temp = data2;
			5'b00011:
				r2_temp = data3;
			5'b00100:
				r2_temp = data4;
			5'b00101:
				r2_temp = data5;
			5'b00110:
				r2_temp = data6;
			5'b00111:
				r2_temp = data7;
			5'b01000:
				r2_temp = data8;
			5'b01001:
				r2_temp = data9;
			5'b01010:
				r2_temp = data10;
			5'b01011:
				r2_temp = data11;
			5'b01100:
				r2_temp = data12;
			5'b01101:
				r2_temp = data13;
			5'b01110:
				r2_temp = data14;
			5'b01111:
				r2_temp = data15;
			5'b10000:
				r2_temp = data16;
			5'b10001:
				r2_temp = data17;
			5'b10010:
				r2_temp = data18;
			5'b10011:
				r2_temp = data19;
			5'b10100:
				r2_temp = data20;
			5'b10101:
				r2_temp = data21;
			5'b10110:
				r2_temp = data22;
			5'b10111:
				r2_temp = data23;
			5'b11000:
				r2_temp = data24;
			5'b11001:
				r2_temp = data25;
			5'b11010:
				r2_temp = data26;
			5'b11011:
				r2_temp = data27;
			5'b11100:
				r2_temp = data28;
			5'b11101:
				r2_temp = data29;
			5'b11110:
				r2_temp = data30;
			5'b11111:
				r2_temp = data31;
			default:
				r2_temp = r2_temp;
		endcase
	end
endmodule

module regfiles_pcreg(
	input clk, // 1 位输入，寄存器时钟信号，下降沿时为 PC寄存器赋值
	input rst, // 1 位输入，重置信号，高电平时将 PC 寄存器清零
	// 注：当 ena 信号无效时，rst 也可以重置寄存器
	input ena, // 1 位输入,有效信号低电平时 PC 寄存器工读入data_in 的值，否则保持原有输出
	input [31:0] data_in, // 31 位输入，输入数据将被存入寄存器内部
	output reg [31:0] data_out // 31 位输出，工作时始终输出 PC 寄存器内部存储的值
	);

	always @(negedge clk or posedge rst) begin
		if (rst == 1)
			data_out = 32'b00000000000000000000000000000000;
		else begin
			if (ena == 0)
				data_out = data_in;
			else
				data_out = data_out;
		end
	end
endmodule
