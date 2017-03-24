`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/06/06 13:57:50
// Design Name: 
// Module Name: hexto7seg
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


module hexto7seg(
    input[3:0] h,
    output[7:0] seg    
    );
    
    assign seg[0] = ~(h == 0|| h == 2|| h == 3|| h == 5|| h == 6|| h == 7|| h == 8|| h == 9|| h == 10||  h == 12|| h == 14|| h == 15);
    assign seg[1] = ~(h == 0|| h == 1|| h == 2|| h == 3|| h == 4|| h == 7|| h == 8|| h == 9|| h == 10|| h == 13);
    assign seg[2] = (h == 2 || h == 12 || h == 14 || h == 15);
    assign seg[3] = (h == 1|| h == 4|| h == 7|| h == 10|| h == 15);
    assign seg[4] = (h == 1 || h == 3 || h == 4|| h == 5|| h == 7|| h == 9);
    assign seg[5] = ~(h == 0|| h == 4|| h == 5|| h == 6|| h == 8|| h == 9|| h == 10|| h == 11|| h == 12|| h == 14|| h == 15);
    assign seg[6] = ~(h == 2|| h == 3|| h == 4|| h == 5|| h == 6|| h == 8|| h == 9|| h == 10|| h == 11|| h == 13|| h == 14|| h == 15);
    assign seg[7] = 1;
       
endmodule
