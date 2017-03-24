`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:18:34 05/25/2016 
// Design Name: 
// Module Name:    Alu 
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
module Alu(
	input [31:0] a, // 32 位输入，操作数 1
	input [31:0] b, // 32 位输入，操作数 2
	input [3:0] aluc, // 4 位输入，控制 alu 的操作
	output[31:0] outmux9, // 32 位输出，有 a b 经过 aluc 指定的操作生成
	output[31:0] outdmemaddr, // 32 位输出，有 a b 经过 aluc 指定的操作生成
	output reg zero, // 0 标志位
	output reg carry, // 进位标志位
	output reg negative, // 负数标志位
	output reg overflow // 溢出标志位
	);

	reg[31:0] _r;
	assign outmux9 = _r;
	assign outdmemaddr = _r;
	wire[31:0] radd, rsub, rand, ror, rxor, rnor, rlui, rlt, rltu, rsra, rsrl, rsl;
	wire add_carry, sub_carry, sl_carry, sra_carry, srl_carry, add_overflow, sub_overflow;

	assign {add_carry, radd[31:0]} = { a[31], a[31:0] } + { b[31], b[31:0] };
	assign {sub_carry, rsub[31:0]} = { a[31], a[31:0] } - { b[31], b[31:0] };
	assign add_overflow = add_carry != radd[31];
	assign sub_overflow = sub_carry != rsub[31];
	assign rand = a & b;
	assign ror =  a | b;
	assign rxor = a ^ b;
	assign rnor = ~(a | b);
	assign rlui = { b[15:0], 16'b0 };
	assign rlt = $signed(a) < $signed(b) ? 1 : 0;
	assign rltu = $unsigned(a) < $unsigned(b) ? 1 : 0;
	assign sra_carry = 0;
	assign srl_carry = 0;
	assign rsra = $signed(b) >>> a;
	assign rsrl = $unsigned(b) >> a;
	assign { sl_carry, rsl } = b << a;

	always @(*) begin
		case(aluc)
			4'b0000: begin
				_r <= radd;
				zero <= radd == 0;
				carry <= add_carry;
				overflow <= 0;
				negative <= 0;
			end
			4'b0010: begin
				_r <= radd;
				zero <= radd == 0;
				carry <= carry;
				overflow <= add_overflow;
				negative <= radd[31];
			end
			4'b0001: begin
				_r <= rsub;
				zero <= rsub == 0;
				carry <= sub_carry;
				negative <= 0;
				overflow <= 0;
			end
			4'b0011: begin
				_r <= rsub;
				zero <= rsub == 0;
				carry <= carry;
				overflow <= sub_overflow;
				negative <= rsub[31];
			end
			4'b0100: begin
				_r <= rand;
				zero <= rand == 0;
				carry <= carry;
				negative <= rand[31];
				overflow <= 0;
			end
			4'b0101: begin
				_r <= ror;
				zero <= ror == 0;
				negative <= ror[31];
				carry <= carry;
				overflow <= 0;
			end
			4'b0110: begin
				_r <= rxor;
				zero <= rxor == 0;
				negative <= rxor[31];
				carry <= carry;
				overflow <= 0;
			end
			4'b0111: begin
				_r <= rnor;
				zero <= rnor == 0;
				negative <= rnor[31];
				carry <= carry;
				overflow <= 0;
			end
			4'b1000: begin
				_r <= rlui;
				zero <= rlui == 0;
				negative <= rlui[31];
				carry <= carry;
				overflow <= 0;
			end
			4'b1001: begin
				_r <= rlui;
				zero <= rlui == 0;
				negative <= rlui[31];
				carry <= carry;
				overflow <= 0;
			end
			4'b1011: begin
				_r <= rlt;
				zero <= rlt == 0;
				negative <= rlt[31];
				carry <= carry;
				overflow <= 0;
			end
			4'b1010: begin
				_r <= rltu;
				zero <= rltu == 0;
				negative <= rltu[31];
				carry <= carry;
				overflow <= 0;
			end
			4'b1100: begin
				_r <= rsra;
				zero <= rsra == 0;
				negative <= rsra[31];
				carry <= sra_carry;
				overflow <= 0;
			end
			4'b1110: begin
				_r <= rsl;
				zero <= rsl == 0;
				negative <= rsl[31];
				carry <= sl_carry;
				overflow <= 0;
			end
			4'b1111: begin
				_r <= rsl;
				zero <= rsl == 0;
				negative <= rsl[31];
				carry <= sl_carry;
				overflow <= 0;
			end
			4'b1101: begin
				_r <= rsrl;
				zero <= rsrl == 0;
				negative <= rsrl[31];
				carry <= srl_carry;
				overflow <= 0;
			end
			default: begin
				_r <= 0;
				zero <= 1;
				negative <= 0;
				overflow <= 0;
				carry <= carry;
			end
		endcase
	end

endmodule

