`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/07 00:47:32
// Design Name: 
// Module Name: flopenr
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


module flopenr
#(parameter Width=8)  (
   input clk,rst,enable,
   input [Width-1:0]d,
   output reg [Width-1:0]q
   );
always@(posedge clk, posedge rst, posedge enable )
    if(rst|!enable) begin q<=0;end
    else  begin q<=d;end

endmodule
