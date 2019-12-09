`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/07 02:24:35
// Design Name: 
// Module Name: addstall
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


module addstall(
	input wire[31:0] a,b,
	input wire stall,
	output reg[31:0] y
    );

	always@(*)
	begin
	   if(stall)
	       y=a-b;
	   else 
	       y=a+b;
	end
endmodule
