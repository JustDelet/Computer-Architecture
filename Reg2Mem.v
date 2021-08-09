`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: USTC ESLAB
// Engineer: Huang Yifan (hyf15@mail.ustc.edu.cn)
// 
// Design Name: Reg2_MEM
// Module Name: Register 2 Seg Reg
// Tool Versions: Vivado 2017.4.1
// Description: Register 2 Seg Reg for EX\MEM
// 
//////////////////////////////////////////////////////////////////////////////////


//  ����˵��
    // EX\MEM�ļĴ����μĴ���
// ����
    // clk               ʱ���ź�
    // reg2_EX           �Ĵ���2����(������ת�����)
    // bubbleM           MEM�׶ε�bubble�ź�
    // flushM            MEM�׶ε�flush�ź�
// ���
    // reg2_MEM           ������һ��ˮ�εļĴ���2����
// ʵ��Ҫ��  
    // �����޸�


module Reg2_MEM(
    input wire clk, bubbleM, flushM,
    input wire [31:0] reg2_EX,
    output reg [31:0] reg2_MEM
    );

    initial reg2_MEM = 0;
    
    always@(posedge clk)
        if (!bubbleM) 
        begin
            if (flushM)
                reg2_MEM <= 0;
            else 
                reg2_MEM <= reg2_EX;
        end
    
endmodule
