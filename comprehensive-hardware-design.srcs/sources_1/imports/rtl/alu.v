`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/06 20:56:41
// Design Name: 
// Module Name: alu
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


// module alu(
//     input [31:0]A,//operated num1
//     input [31:0]B,//operated num2
//     input [2:0] op,//operate
//     output wire [31:0] res
//     // output reg [31:0] overflow,
//     // output wire zero
//     );

//     // assign zero = (A == B) ? 1 : 0;
//     assign res = 32'b0 | (op == 3'b000) ? A & B:
//                 (op == 3'b001) ? A | B:
//                 (op == 3'b010) ? A + B:
//                 (op == 3'b100) ? A &~ B:
//                 (op == 3'b101) ? A |~ B: 
//                 (op == 3'b110) ? A - B: 
//                 (op == 3'b111) ? (A < B ? 1 : 0):
//                 32'h00000000;
// endmodule


module alu(num1,
           num2,
            op,
            res,
           

    );
 
input [31:0]num1;
input  [2:0]op;
input [31:0]num2;
reg [6:0]dout;
output reg [31:0]res;


//�ֱ�ͬ������
always@(*)
    case(op)
        3'b000: res=num1&num2;
        3'b001: res=num1|num2;
        3'b010: res=num1+num2;
        3'b100: res=num1&~num2;
        3'b101: res=num1|~num2;
        3'b110: res=num1-num2;
        3'b111: 
            if (num1<num2)
                res=32'b00000001;
            else
                res=32'b00000000;
                
        default:res=32'b00000000;
               
    endcase
endmodule