`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/06/06 13:51:15
// Design Name: 
// Module Name: display8digit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module display8digit(
    input wire [31:0] val,
    input wire clock,
    output wire [7:0] segments,
    output wire [7:0] digitselect
    );

	reg [31:0] counter = 0;
	wire [2:0] topthree;
	wire [3:0] value4bit;
	
	always @(posedge clock)
		counter <= counter + 1'b1;
	
	assign topthree[2:0] = counter[19:17];
	// assign toptwo[1:0] = counter[23:22];  // Try this instead to slow things down!

	
	assign digitselect[7:0] = ~ (  topthree == 3'b000 ? 8'b00000001  // Note inversion
				     : topthree == 3'b001 ? 8'b00000010
				     : topthree == 3'b010 ? 8'b00000100
				     : topthree == 3'b011 ? 8'b00001000
				     : topthree == 3'b100 ? 8'b00010000
				     : topthree == 3'b101 ? 8'b00100000
				     : topthree == 3'b110 ? 8'b01000000
				     :                      8'b10000000 );
		
	assign value4bit   =   (  topthree == 3'b000 ? val[3:0]
                            : topthree == 3'b001 ? val[7:4]
                            : topthree == 3'b010 ? val[11:8]
                            : topthree == 3'b011 ? val[15:12]
                            : topthree == 3'b100 ? val[19:16]
                            : topthree == 3'b101 ? val[23:20]
                            : topthree == 3'b110 ? val[27:24]
                            : val[31:28] );
	
	hexto7seg myhexencoder(value4bit, segments);

endmodule
