`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/06 20:56:41
// Design Name: 
// Module Name: miandec
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


module maindec(input  [5:0] op,
                   output memtoreg, memwrite,
                   output branch, alusrc, 
                   output regdst, regwrite,
                   output  jump, output [1:0] aluop);
reg [8:0] controls;//�������ź�
assign {regwrite, regdst, alusrc, branch, memwrite, memtoreg, jump, aluop}= controls;
always@(*)
    case(op) 
        6'b000000: controls<=9'b110000010; //Rtyp�����ܶ�Ӧ���alu�����ź� 
        6'b100011: controls<=9'b101001000; //������ȡ��ʱ��Ӧ�Ŀ����ź�
        6'b101011: controls<=9'b001010000; //����������ʱ��Ӧ�Ŀ����ź�
        6'b000100: controls<=9'b000100001; //������תʱ��Ӧ�Ŀ����ź�
        6'b001000: controls<=9'b101000000; //����������Ӧ�������ź�
        6'b000010: controls<=9'b000000100; //��תʱ��Ӧ�Ŀ����ź� 
        default: controls<=9'bxxxxxxxxx; //Ĭ��
//        default: controls<=9'b000000000; //Ĭ��
      endcase 
 endmodule
