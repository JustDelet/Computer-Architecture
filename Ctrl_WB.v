`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: USTC ESLAB
// Engineer: Huang Yifan (hyf15@mail.ustc.edu.cn)
// 
// Design Name: Ctrl_WB
// Module Name: Control Signal Seg Reg
// Tool Versions: Vivado 2017.4.1
// Description: Control signal seg reg for MEM\WB
// 
//////////////////////////////////////////////////////////////////////////////////


//  ����˵��
    // MEM\WB�Ŀ����źŶμĴ���
// ����
    // clk                  ʱ���ź�
    // reg_write_en_MEM     ͨ�üĴ���дʹ��
    // bubbleW              WB�׶ε�bubble�ź�
    // flushW               WB�׶ε�flush�ź�
// ���
    // reg_write_en_WB      ������һ��ˮ�ε�ͨ�üĴ���дʹ��

// ʵ��Ҫ��  
    // �����޸�



module Ctrl_WB(
    input wire clk, bubbleW, flushW,
    input wire reg_write_en_MEM,
    output reg reg_write_en_WB
    );

    initial reg_write_en_WB = 0;
    
    always@(posedge clk)
        if (!bubbleW) 
        begin
            if (flushW)
                reg_write_en_WB <= 0;
            else 
                reg_write_en_WB <= reg_write_en_MEM;
        end
    
endmodule
