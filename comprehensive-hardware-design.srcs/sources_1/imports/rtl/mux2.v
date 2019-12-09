`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/06 20:56:41
// Design Name: 
// Module Name: mux2
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


module mux2
#(parameter Width =8)
(
    input [Width-1:0]a,
    input [Width-1:0]b,
    input sel,
    output reg [Width-1:0]res

    );
    always@(*)
        if(sel==0)
            res<=a;
       else 
            res<=b;

endmodule
