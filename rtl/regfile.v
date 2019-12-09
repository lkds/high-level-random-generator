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
	input wire we3,//a3��ַдʹ���ź�
	input wire[4:0] ra1,ra2,wa3,
	input wire[31:0] wd3,//д�����ݣ�memtoreg
	output reg[31:0] rd1,rd2//���ra1��ra2�ĵ�ַ����
    );

	reg [31:0] rf[31:0];//32���Ĵ���

	always @(posedge clk) begin//memtoreg
		if(we3) begin
			 rf[wa3] <= wd3;
		end
	end
	always @(*) begin
		if(we3 & (ra1==wa3)) begin//����ǰ�ƣ������һ��ָ���õ�����һ����δ��ɵ�ָ�
			rd1<=wd3;
		end
		else 
		begin
		       rd1 <= (ra1 != 0) ? rf[ra1] : 0;
		end
	end
	always @(*) begin
		if(we3 & (ra2==wa3)) begin//����ǰ��
			rd2<=wd3;
		end
		else 
		begin
		      rd2 <= (ra2 != 0) ? rf[ra2] : 0;
		end
	end
endmodule
