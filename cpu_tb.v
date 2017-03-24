`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:10:00 06/06/2016
// Design Name:   cpu
// Module Name:   E:/MYCPU/cpu_tb.v
// Project Name:  MYCPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: cpu
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module cpu_tb;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	//wire alu_c;
	//wire alu_n;
	wire [31:0] RS;
	wire [31:0] RT;
	wire [31:0] RD;
	wire [31:0] ALUA;
	wire [31:0] ALUB;
	wire [31:0] PCOUT;
	
	wire ps2_clk;
	wire ps2_data;
   wire [7:0] segments;
   wire [7:0] digitselect;
	
	//wire [31:0] INSO;
	// Instantiate the Unit Under Test (UUT)
	cpu uut (
		.clk100mhz(clk), 
		.frst(rst),
		.ps2_clk(ps2_clk),
		.ps2_data(ps2_data),
		.segments(segments),
		.digitselect(digitselect)
		//.alu_c(alu_c), 
		//.alu_n(alu_n)
		//.alu_n(alu_n)
		/*
		.RS(RS),
		.RT(RT),
		.RD(RD),
		.ALUA(ALUA),
		.ALUB(ALUB),
		.PCOUT(PCOUT)*/
	//	.INSO(INSO)
	);

	integer i = 0;
   integer fp;
	
	initial begin
		  fp = $fopen("result.txt"); 
		  
        clk <= 1'b0;
		  rst = 0;
		  #100
		  rst = 1;
        
        for( i = 0; i < 10000000; i = i + 1) begin
            @( posedge clk );
				//$fdisplay(fp, "regfiles8 = %h", cpu_tb.uut.regfiles.rdata[8]);
			//	$monitor("uuuuut = %x", cpu_tb.uut.aluout[1]);
				//$monitor("imemout0 = %x", cpu_tb.uut.imemout0);
				//imemout0
				
            $fdisplay(fp, "regfiles0 = %h", cpu_tb.uut.regfiles.rdata[0]);
            $fdisplay(fp, "regfiles1 = %h", cpu_tb.uut.regfiles.rdata[1]);
            $fdisplay(fp, "regfiles2 = %h", cpu_tb.uut.regfiles.rdata[2]);
            $fdisplay(fp, "regfiles3 = %h", cpu_tb.uut.regfiles.rdata[3]);
            $fdisplay(fp, "regfiles4 = %h", cpu_tb.uut.regfiles.rdata[4]);
            $fdisplay(fp, "regfiles5 = %h", cpu_tb.uut.regfiles.rdata[5]);
            $fdisplay(fp, "regfiles6 = %h", cpu_tb.uut.regfiles.rdata[6]);
            $fdisplay(fp, "regfiles7 = %h", cpu_tb.uut.regfiles.rdata[7]);
            $fdisplay(fp, "regfiles8 = %h", cpu_tb.uut.regfiles.rdata[8]);
            $fdisplay(fp, "regfiles9 = %h", cpu_tb.uut.regfiles.rdata[9]);
            $fdisplay(fp, "regfiles10 = %h", cpu_tb.uut.regfiles.rdata[10]);
            $fdisplay(fp, "regfiles11 = %h", cpu_tb.uut.regfiles.rdata[11]);
            $fdisplay(fp, "regfiles12 = %h", cpu_tb.uut.regfiles.rdata[12]);
            $fdisplay(fp, "regfiles13 = %h", cpu_tb.uut.regfiles.rdata[13]);
            $fdisplay(fp, "regfiles14 = %h", cpu_tb.uut.regfiles.rdata[14]);
            $fdisplay(fp, "regfiles15 = %h", cpu_tb.uut.regfiles.rdata[15]);
            $fdisplay(fp, "regfiles16 = %h", cpu_tb.uut.regfiles.rdata[16]);
            $fdisplay(fp, "regfiles17 = %h", cpu_tb.uut.regfiles.rdata[17]);
            $fdisplay(fp, "regfiles18 = %h", cpu_tb.uut.regfiles.rdata[18]);
            $fdisplay(fp, "regfiles19 = %h", cpu_tb.uut.regfiles.rdata[19]);
            $fdisplay(fp, "regfiles20 = %h", cpu_tb.uut.regfiles.rdata[20]);
            $fdisplay(fp, "regfiles21 = %h", cpu_tb.uut.regfiles.rdata[21]);
            $fdisplay(fp, "regfiles22 = %h", cpu_tb.uut.regfiles.rdata[22]);
            $fdisplay(fp, "regfiles23 = %h", cpu_tb.uut.regfiles.rdata[23]);
            $fdisplay(fp, "regfiles24 = %h", cpu_tb.uut.regfiles.rdata[24]);
            $fdisplay(fp, "regfiles25 = %h", cpu_tb.uut.regfiles.rdata[25]);
            $fdisplay(fp, "regfiles26 = %h", cpu_tb.uut.regfiles.rdata[26]);
            $fdisplay(fp, "regfiles27 = %h", cpu_tb.uut.regfiles.rdata[27]);
            $fdisplay(fp, "regfiles28 = %h", cpu_tb.uut.regfiles.rdata[28]);
            $fdisplay(fp, "regfiles29 = %h", cpu_tb.uut.regfiles.rdata[29]);
            $fdisplay(fp, "regfiles30 = %h", cpu_tb.uut.regfiles.rdata[30]);
            $fdisplay(fp, "regfiles31 = %h", cpu_tb.uut.regfiles.rdata[31]);
            
            $fdisplay(fp, "instr = %h", cpu_tb.uut.imemout0);
            $fdisplay(fp, "pc = %h", cpu_tb.uut.pcout0);
            
            if (cpu_tb.uut.pcout0 == 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) begin
                $finish;
            end
				/*
				if (PCOUT > 32'h000003b0) begin
					$fdisplay(fp, "RS = %h",RS);
					$fdisplay(fp, "RT = %h",RT);
					$fdisplay(fp, "RD = %h",RD);
					$fdisplay(fp, "ALUA = %h",ALUA);
					$fdisplay(fp, "ALUB = %h",ALUB);
					$fdisplay(fp, "PCOUT = %h",PCOUT);
				end*/
        end
        
        $finish;
   end
    
   always begin
       #50
		 clk <= ~clk;
	end
      
endmodule

