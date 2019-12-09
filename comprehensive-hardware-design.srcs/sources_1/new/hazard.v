`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/07 01:40:53
// Design Name: 
// Module Name: hazard
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


module hazard(
//fetch stage
		output reg stallF,
		//decode stage
		input wire [4:0] rsD,rtD,
		input wire branchD,
		output reg forwardaD,forwardbD,
		output reg stallD,
		//execute stage
		input wire [4:0]rsE,rtE,
		input wire [4:0]writeregE,
		input wire regwriteE,
		input wire memtoregE,
		output reg[1:0]forwardaE,forwardbE,
		output reg flushE,
		//mem stage
		input wire [4:0]writeregM,
		input wire regwriteM,
		input wire memtoregM,
		//write back stage
		input wire [4:0]writeregW,
		input wire regwriteW

    );
    reg lwstall;
    reg branchstall;
    always@(*)//第一个寄存器指令的25：21段发生数据冒险
    begin
        if((rsE != 0) & (rsE == writeregM) & regwriteM)    //前级流水线到达访存阶段M
			forwardaE = 2'b10;
	    else if((rsE != 0)& (rsE == writeregW) & regwriteW) //前级流水线到达回写阶段W
	      	forwardaE= 2'b01;
	    else forwardaE = 2'b00;//没有数据前推
 
    end
      always@(*)//第二个寄存器，指令的20：16段发送数据冒险
    begin
        if((rtE != 0) & (rtE == writeregM) & regwriteM)     
			forwardbE = 2'b10;
	    else if((rtE != 0)& (rtE == writeregW) & regwriteW) 
	      	forwardbE= 2'b01;
	    else forwardbE = 2'b00;
 
    end
   always@(*)
   begin
        if(((rsD==rtE) | (rtD==rtE)) & memtoregE)//如果下一级流水线的所用的寄存器地址（rsD，rtD）与前一级流水线正在处理的寄存器地址（rtE,也就是lw指令的20：16位）相同，就暂停
        begin
            lwstall=1;
            stallF=1;//pc自增信号暂停
            stallD=1;//取指译码暂停
            flushE=1;//清空从译码到执行阶段传递的所有数据
            
        end
        else
        begin
            lwstall=0;
            stallF=0;
            stallD=0;
            flushE=0;
        end    
   end
   always@(*)
   begin
        if((rsD !=0) & (rsD == writeregM) & regwriteM)//控制冒险导致的数据冒险，需要将数据前推，寄存器1
            forwardaD=1;
        else
            forwardaD=0;
   end
   always@(*)
   begin
        if((rtD !=0) & (rtD == writeregM) & regwriteM)//同上，寄存器2
            forwardbD=1;
        else
            forwardbD=0;
   end
    always@(*)
   begin
        if(branchD & regwriteE & (writeregE == rsD | writeregE == rtD)  | branchD & memtoregM & (writeregM == rsD | writeregM == rtD))
        begin
            branchstall=1;
            flushE = lwstall | branchstall;
            stallF= lwstall | branchstall;
	        stallD= lwstall | branchstall;
	    end
            
        else
        begin
            branchstall=0;
            flushE = lwstall | branchstall;
            stallF= lwstall | branchstall;
	        stallD= lwstall | branchstall;
        end
    
   end

endmodule

