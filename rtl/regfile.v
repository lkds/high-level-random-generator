`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/06 20:56:41
// Design Name: 
// Module Name: regfile
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


module regfile(
	input wire clk,
	input wire we3,//a3地址写使能信号
	input wire[4:0] ra1,ra2,wa3,
	input wire[31:0] wd3,//写入数据，memtoreg
	output reg[31:0] rd1,rd2//输出ra1，ra2的地址内容
    );

	reg [31:0] rf[31:0];//32个寄存器

	always @(posedge clk) begin//memtoreg
		if(we3) begin
			 rf[wa3] <= wd3;
		end
	end
	always @(*) begin
		if(we3 & (ra1==wa3)) begin//数据前推（如果下一条指令用到了上一条还未完成的指令）
			rd1<=wd3;
		end
		else 
		begin
		       rd1 <= (ra1 != 0) ? rf[ra1] : 0;
		end
	end
	always @(*) begin
		if(we3 & (ra2==wa3)) begin//数据前推
			rd2<=wd3;
		end
		else 
		begin
		      rd2 <= (ra2 != 0) ? rf[ra2] : 0;
		end
	end
endmodule
