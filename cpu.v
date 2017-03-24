`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:42:18 06/01/2016 
// Design Name: 
// Module Name:    cpu 
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
module cpu(
	//input clk,
	//input rst,
	input clk100mhz,
	input frst,
	input ps2_clk,
	input ps2_data,
   output [7:0] segments,
   output [7:0] digitselect
	/*
	output [31:0] RS,
	output [31:0] RT,
	output [31:0] RD,
	output [31:0] ALUA,
	output [31:0] ALUB,
	output [31:0] PCOUT
	//output [31:0] INSO*/
   );
	
	wire rst = (!frst); //C12需要取反
	wire clk;//CPUclk
	//assign clk = clk100mhz;
	
	reg [2:0] cnt; //分频
	assign clk = cnt[2];
	always @(posedge clk100mhz or posedge rst) begin
		if (rst == 1)
			cnt <= 0;
		else
			cnt <= cnt + 1;
	end
	/*
	wire clk100 = clk100mhz;
	wire ps2clk = ps2_clk;
	wire ps2data = ps2_data;
	wire [7:0] seg;
	assign segments = seg;
	wire [7:0] dig;
	assign digitselect = dig;*/
	//kb_8dig test(.clk(clk100mhz),.ps2_data(ps2_data),.ps2_clk(ps2_clk),.segments(segments),.digitselect(digitselect));
	
	
	wire [31:0] kbd;
	
	wire [31:0] npcout[0:2];
	wire [31:0] pcout0;
	wire [31:0] pcout1;
	wire [31:0] pcout2;
	wire [3:0]  pcout3;
	wire [31:0] combinout;
	wire [31:0] muxout[0:8];
	wire [4:0]  muxout10;
	wire [4:0]  muxout11, muxout12;
	wire muxout13, muxout14, muxout15, muxout16, muxout17;
	wire [31:0] ext5out[0:1];
	wire [31:0] ext16out[0:1];
	wire [31:0] ext18out;
	wire [31:0] addout;
	wire [31:0] imemout0;
	wire [4:0]  imemout1;
	wire [15:0] imemout2;
	wire [17:0] imemout3;
	wire [27:0] imemout4;
	wire [5:0] imemout5;
	wire [5:0] imemout6;
	wire [31:0] regfilesout[0:3];
	wire [31:0] aluout[0:1];
	wire [31:0] dmemout;
	wire ins_decoderout[0:31];
	wire alu_z;
	wire alu_o;
	wire m[0:14];
	wire ext5_s;
	wire ext16_s;
	wire ext18_s;
	wire RF_W;
	wire [3:0] aluc;
	wire dmem_w;
	wire dmem_cs;
	wire dmem_r;
	wire [4:0] IM2016;
	wire [4:0] IM1511;
	wire [30:0] data_decoder;
	wire [4:0] RSC4_0;
	wire [4:0] RTC4_0;
	
	assign RS = regfilesout[0];
	assign RT = regfilesout[2];
	assign RD = muxout[8];
	assign ALUA = muxout[7];
	assign ALUB = muxout[6];
	assign PCOUT = pcout0;

   wire ADD= 	imemout5 == 0 && imemout6 == 6'b100000;
	wire ADDI=	imemout5 == 6'b001000 ;
	wire ADDU=	imemout5 == 6'b000000  && imemout6 == 6'b100001 ;
	wire ADDIU=	imemout5 == 6'b001001;
	wire AND=	imemout5 == 6'b000000  && imemout6 == 6'b100100 ;
	wire ANDI=	imemout5 == 6'b001100;
	wire NOR=	imemout5 == 6'b000000  && imemout6 == 6'b100111 ;
	wire OR=		imemout5 == 6'b000000  && imemout6 == 6'b100101 ;
	wire ORI=	imemout5 == 6'b001101;
	wire SLL=	imemout5 == 6'b000000  && imemout6 == 6'b000000 ;
	wire SRL=	imemout5 == 6'b000000  && imemout6 == 6'b000010 ;
	wire SRA=	imemout5 == 6'b000000  && imemout6 == 6'b000011 ;
	wire SRLV=	imemout5 == 6'b000000  && imemout6 == 6'b000110 ;
	wire SRAV=	imemout5 == 6'b000000  && imemout6 == 6'b000111 ;
	wire SLLV=	imemout5 == 6'b000000  && imemout6 == 6'b000100 ;
	wire SUB=	imemout5 == 6'b000000  && imemout6 == 6'b100010 ;
	wire SUBU=	imemout5 == 6'b000000  && imemout6 == 6'b100011 ;
	wire XOR=	imemout5 == 6'b000000  && imemout6 == 6'b100110 ;
	wire XORI=	imemout5 == 6'b001110;
	wire LUI=	imemout5 == 6'b001111;
	wire SLT=	imemout5 == 6'b000000  && imemout6 == 6'b101010 ;
	wire SLTI=	imemout5 == 6'b001010;
	wire SLTU=	imemout5 == 6'b000000  && imemout6 == 6'b101011 ;
	wire SLTIU=	imemout5 == 6'b001011;
	wire BEQ=	imemout5 == 6'b000100;
	wire BNE=	imemout5 == 6'b000101;
	wire J=		imemout5 == 6'b000010;
	wire JAL=	imemout5 == 6'b000011;
	wire JR=		imemout5 == 6'b000000  && imemout6 == 6'b001000 ;
	wire LW=		imemout5 == 6'b100011;
	wire SW=		imemout5 == 6'b101011;

	assign RSC4_0 = {imemout0[25:21]};
	assign RTC4_0 = {imemout0[20:16]};
	assign m[4] = ADD | ADDU | SUB | SUBU | AND | OR | XOR | NOR | SLT | SLTU | SLLV | SRLV | SRAV | ADDI | ADDIU | ANDI | ORI | XORI | LW | SW | BEQ | BNE | SLTI | SLTIU;
	assign m[5] = JAL;
	assign m[6] = JAL;
	assign m[7] = ADDI | ADDIU | ANDI | ORI | XORI | LW | SW | SLTI | SLTIU | LUI;
	assign m[8] = JAL;
	assign aluc[3] = SLT | SLTU | SLL | SRL | SRA | SLLV | SRLV | SRAV | SLTI | SLTIU | LUI;
	assign aluc[2] = AND | OR | XOR | NOR | SLL | SRL | SRA | SLLV | SRLV | SRAV | ANDI | ORI | XORI;
	assign aluc[1] = ADD | SUB | XOR | NOR | SLT | SLTU | SLL | SLLV | ADDI | XORI | LW | SW | BEQ | BNE | SLTI | SLTIU | JAL;
	assign aluc[0] = SUB | SUBU | OR | NOR | SLT | SRL | SRLV | ORI | BEQ | BNE | SLTI;
	assign m[9] = LW;
	assign IM1511 = {imemout0[15:11]};
	assign IM2016 = {imemout0[20:16]};
	assign RF_W = ADD | ADDU | SUB | SUBU | AND | OR | XOR | NOR | SLT | SLTU | SLL | SRL | SRA | SLLV | SRLV | SRAV | ADDI | ADDIU | ANDI | ORI | XORI | LW | SLTI | SLTIU | LUI | JAL;
	assign m[2] = JR;
	assign m[3] = ADD | ADDU | SUB | SUBU | AND | OR | XOR | NOR | SLT | SLTU | SLL | SRL | SRA | SLLV | SRLV | SRAV | ADDI | ADDIU | ANDI | ORI | XORI | LW | SW | BEQ | BNE | SLTI | SLTIU | LUI;
	assign m[10] = SLL | SRL | SRA;
	assign ext5_s = 0;
	assign ext16_s = ADDI | ADDIU | LW | SW | SLTI | SLTIU | LUI;
	assign ext18_s = BEQ | BNE;
	assign dmem_cs = LW | SW;
	assign dmem_r = LW;
	assign dmem_w = SW;
	assign m[11] = ADD | ADDU | SUB | SUBU | AND | OR | XOR | NOR | SLT | SLTU | SLL | SRL | SRA | SLLV | SRLV | SRAV;
	assign m[12] = JAL;
	assign m[13] = BNE;
	assign m[14] = BEQ | BNE;
	
	Npc   npc(.npc_inpc(pcout1), .npc_outpc(npcout[1]));
	Pc	 pc(.clk(clk), .rst(rst), .pc_inmux3(muxout[2]), .pc_outimem(pcout0), .pc_outnpc(pcout1), .pc_outmux5(pcout2), .pc_outcombin(pcout3), .pc_outadd(npcout[2]));
	Imem  imem(.imem_inaddr(pcout0), .imem_outcontrol(imemout0), .imem_outmux10(imemout1), .imem_outext16(imemout2), .imem_outext18(imemout3), .imem_outcombin(imemout4), .imem_outinsdec31_26(imemout5), .imem_outinsdec5_0(imemout6));
	Combin combin(.combin_inpc(pcout3), .combin_inimem(imemout4), .combin_outmux2(combinout));
	Regfiles regfiles(.clk(clk), .rst(rst), .we(muxout17), .regfiles_inRsc(RSC4_0), .regfiles_inRtc(RTC4_0), .waddr(muxout12), .wdata(muxout[8]), .regfiles_outmux2(regfilesout[0]), .regfiles_outmux4(regfilesout[1]), .regfiles_outmux6(regfilesout[2]), .regfiles_outdmem(regfilesout[3]),.shuma(kbd));
	Alu	 alu(.a(muxout[7]), .b(muxout[6]), .aluc(aluc), .outmux9(aluout[0]), .outdmemaddr(aluout[1]), .zero(alu_z), .carry(alu_c), .negative(alu_n), .overflow(alu_o));
	Ram	 ram(.clk100mhz(clk100mhz),.ps2_clk(ps2_clk),.ps2_data(ps2_data),.clk(clk), .dmem_cs(dmem_cs), .ram_r(dmem_r), .wena(dmem_w), .ram_inaddr(aluout[1]), .data_in(regfilesout[3]), .data_out(dmemout));
	Ext5  ext5(.ext5_inmux10(muxout10), .ext5_s(ext5_s), .ext5_outmux4(ext5out[0]), .ext5_outmux6(ext5out[1]));
	Ext16 ext16(.ext16_inimem(imemout2), .ext16_s(ext16_s), .ext16_outmux5(ext16out[0]), .ext16_outmux7(ext16out[1]));
	Ext18 ext18(.ext18_inimem(imemout3), .ext18_s(ext18_s), .ext18_outadd(ext18out));
	Add   add(.add_ina(ext18out), .add_inb(npcout[2]), .add_out(addout));
	Mux1 mux13(.mux_in0(muxout15), .mux_in1(muxout16), .m(m[13]), .mux_out(muxout13));
	Mux1 mux14(.mux_in0(1'b0), .mux_in1(muxout13), .m(m[14]), .mux_out(muxout14));
	Mux1 mux15(.mux_in0(1'b0), .mux_in1(1'b1), .m(alu_z), .mux_out(muxout15));
	Mux1 mux16(.mux_in0(1'b1), .mux_in1(1'b0), .m(alu_z), .mux_out(muxout16));
	Mux1 mux17(.mux_in0(RF_W), .mux_in1(1'b0), .m(alu_o), .mux_out(muxout17));
	Mux5 mux10(.mux_in0(5'b01000), .mux_in1(imemout1), .m(m[10]), .mux_out(muxout10));
	Mux5 mux11(.mux_in0(IM2016), .mux_in1(IM1511), .m(m[11]), .mux_out(muxout11));
	Mux5 mux12(.mux_in0(muxout11), .mux_in1(5'b11111), .m(m[12]), .mux_out(muxout12));
	Mux31 mux1(.mux_in0(npcout[1]), .mux_in1(addout), .m(muxout14), .mux_out(muxout[0]));
	Mux31 mux2(.mux_in0(combinout), .mux_in1(regfilesout[0]), .m(m[2]), .mux_out(muxout[1]));
	Mux31 mux3(.mux_in0(muxout[1]), .mux_in1(muxout[0]), .m(m[3]), .mux_out(muxout[2]));
	Mux31 mux4(.mux_in0(ext5out[0]), .mux_in1(regfilesout[1]), .m(m[4]), .mux_out(muxout[3]));
	Mux31 mux5(.mux_in0(ext16out[0]), .mux_in1(pcout2), .m(m[5]), .mux_out(muxout[4]));
	Mux31 mux6(.mux_in0(regfilesout[2]), .mux_in1(ext5out[1]), .m(m[6]), .mux_out(muxout[5]));
	Mux31 mux7(.mux_in0(muxout[5]), .mux_in1(ext16out[1]), .m(m[7]), .mux_out(muxout[6]));
	Mux31 mux8(.mux_in0(muxout[3]), .mux_in1(muxout[4]), .m(m[8]), .mux_out(muxout[7]));
	Mux31 mux9(.mux_in0(aluout[0]), .mux_in1(dmemout), .m(m[9]), .mux_out(muxout[8]));
	
	//wire [31:0] kb_out;
	
//	keyboard keyb(.clk(clk100mhz), .ps2_clk(ps2_clk), .ps2_data(ps2_data), .keyb_char(kb_out));
	
//	wire [31:0] dis;
//	assign dis = (kb_out[15:12] == 4'h0) ? kb_out : kbd;
	display8digit disp(.val(kbd),.clock(clk100mhz),.segments(segments), .digitselect(digitselect));
endmodule
