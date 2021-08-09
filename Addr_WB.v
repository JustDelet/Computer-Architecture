`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: USTC ESLAB
// Engineer: Huang Yifan (hyf15@mail.ustc.edu.cn)
// 
// Design Name: Addr_WB
// Module Name: Register Address seg reg
// Tool Versions: Vivado 2017.4.1
// Description: Register address seg reg for MEM\WB
// 
//////////////////////////////////////////////////////////////////////////////////


//  ����˵��
    // MEM\WB�ļĴ�����ַ�μĴ�������������Դ�Ĵ�����һ��Ŀ��Ĵ����ĵ�ַ
// ����
    // clk               ʱ���ź�
    // reg_dest_MEM      MEM�׶ε�Ŀ��Ĵ�����ַ
    // bubbleW           WB�׶ε�bubble�ź�
    // flushW            WB�׶ε�flush�ź�
// ���
    // reg_dest_WB       ������һ��ˮ�ε�Ŀ��Ĵ�����ַ
// ʵ��Ҫ��  
    // �����޸�

module Addr_WB(
    input wire clk, bubbleW, flushW,
    input wire [4:0] reg_dest_MEM,
    output reg [4:0] reg_dest_WB
    );

    initial reg_dest_WB = 4'h0;
    
    always@(posedge clk)
        if (!bubbleW) 
        begin
            if (flushW)
                reg_dest_WB <= 4'h0;
            else 
                reg_dest_WB <= reg_dest_MEM;
        end
    
endmodule
