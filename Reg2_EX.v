`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: USTC ESLAB
// Engineer: Huang Yifan (hyf15@mail.ustc.edu.cn)
// 
// Design Name: RV32I Core
// Module Name: Register 2 Seg Reg
// Tool Versions: Vivado 2017.4.1
// Description: Register 2 Seg Reg for ID\EX
// 
//////////////////////////////////////////////////////////////////////////////////


//  ����˵��
    // ID\EX�ļĴ����μĴ���
// ����
    // clk               ʱ���ź�
    // reg2              General Register File��ȡ�ļĴ���2����
    // bubbleE           EX�׶ε�bubble�ź�
    // flushE            EX�׶ε�flush�ź�
// ���
    // reg2_EX           ������һ��ˮ�εļĴ���2����
// ʵ��Ҫ��  
    // �����޸�


module Reg2_EX(
    input wire clk, bubbleE, flushE,
    input wire [31:0] reg2,
    output reg [31:0] reg2_EX
    );

    initial reg2_EX = 0;
    
    always@(posedge clk)
        if (!bubbleE) 
        begin
            if (flushE)
                reg2_EX <= 0;
            else 
                reg2_EX <= reg2;
        end
    
endmodule
