`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: USTC ESLAB
// Engineer: Huang Yifan (hyf15@mail.ustc.edu.cn)
// 
// Design Name: RV32I Core
// Module Name: Operator 1 Seg Reg
// Tool Versions: Vivado 2017.4.1
// Description: Operator 1 Seg Reg for ID\EX
// 
//////////////////////////////////////////////////////////////////////////////////


//  ����˵��
    // ID\EX�Ĳ�����1�μĴ���
// ����
    // clk               ʱ���ź�
    // reg1              General Register File��ȡ�ļĴ���1����
    // bubbleE           EX�׶ε�bubble�ź�
    // flushE            EX�׶ε�flush�ź�
// ���
    // reg1_EX           ������һ��ˮ�εļĴ���1����
// ʵ��Ҫ��  
    // �����޸�

module Op1_EX(
    input wire clk, bubbleE, flushE,
    input wire [31:0] reg1,
    output reg [31:0] reg1_EX
    );

    initial reg1_EX = 0;
    
    always@(posedge clk)
        if (!bubbleE) 
        begin
            if (flushE)
                reg1_EX <= 0;
            else 
                reg1_EX <= reg1;
        end
    
endmodule
