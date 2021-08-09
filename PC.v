`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: USTC ESLAB
// Engineer: Huang Yifan (hyf15@mail.ustc.edu.cn)
// 
// Design Name: RV32I Core
// Module Name: PC
// Tool Versions: Vivado 2017.4.1
// Description: RV32I PC Module
// 
//////////////////////////////////////////////////////////////////////////////////


//  ����˵��
    // �洢��ǰ��ˮ����Ҫִ�е�ָ���ַ
// ����
    // clk               ʱ���ź�
    // NPC               NPC_Generator���ɵ���һ��ָ���ַ
// ���
    // PC                ��ˮ����Ҫ�����ָ���ַ
// ʵ��Ҫ��  
    // �����޸�


module PC_IF(
    input wire clk, bubbleF, flushF,
    input wire [31:0] NPC,
    output reg [31:0] PC
    );

    initial PC = 0;
    
    always@(posedge clk)
        if (!bubbleF) 
        begin
            if (flushF)
                PC <= 0;
            else 
                PC <= NPC;
        end
    

endmodule