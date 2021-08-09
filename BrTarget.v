`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: USTC ESLAB
// Engineer: Huang Yifan (hyf15@mail.ustc.edu.cn)
// 
// Design Name: RV32I Core
// Module Name: BR Target Seg Reg
// Tool Versions: Vivado 2017.4.1
// Description: Jal\Branch Target Seg Reg for ID\EX
// 
//////////////////////////////////////////////////////////////////////////////////


//  ����˵��
    // Jal\Branch��ת��ַ�ĶμĴ���
    // Jal����ת��ַ��ID�׶μ���ò�����NPC_Generator
    // Branch����ת��ַ��ID�׶μ���ã���һ�׶η���NPC_Generator
// ����
    // clk               ʱ���ź�
    // address           ��ת��ַ(Jal��Branch)
    // bubbleE           EX�׶ε�bubble�ź�
    // flushE            EX�׶ε�flush�ź�
// ���
    // address_EX        ������һ��ˮ�ε���ת��ַ(Branch)
// ʵ��Ҫ��  
    // �����޸�


module BR_Target_EX(
    input wire clk, bubbleE, flushE,
    input wire [31:0] address,
    output reg [31:0] address_EX
    );

    initial address_EX = 0;
    
    always@(posedge clk)
        if (!bubbleE) 
        begin
            if (flushE)
                address_EX <= 0;
            else 
                address_EX <= address;
        end
    
endmodule