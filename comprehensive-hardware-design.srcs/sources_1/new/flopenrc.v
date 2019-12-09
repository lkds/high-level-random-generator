`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/07 00:47:32
// Design Name: 
// Module Name: flopenrc
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


module flopenrc
#(parameter Width=8)(
   input clk,rst,enable,clear,
   input [Width-1:0]d,
   output reg [Width-1:0]q
   );
always@(posedge clk, posedge rst )
    if(rst|clear|~enable) begin q<=0;end
    else  begin q<=d;end

endmodule
