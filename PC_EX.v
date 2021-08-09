`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: USTC ESLAB
// Engineer: Huang Yifan (hyf15@mail.ustc.edu.cn)
// 
// Design Name: RV32I Core
// Module Name: PC EX Seg Reg
// Tool Versions: Vivado 2017.4.1
// Description: PC seg reg for ID\EX
// 
//////////////////////////////////////////////////////////////////////////////////


//  ����˵��
    // ID\EX��PC�μĴ���
// ����
    // clk               ʱ���ź�
    // PC_ID             PC�Ĵ���������ָ���ַ
    // bubbleE           EX�׶ε�bubble�ź�
    // flushE            EX�׶ε�flush�ź�
// ���
    // PC_EX             ������һ��ˮ�ε�PC��ַ
// ʵ��Ҫ��  
    // �����޸�

module PC_EX(
    input wire clk, bubbleE, flushE,
    input wire [31:0] PC_ID,
    output reg [31:0] PC_EX
    );

    initial PC_EX = 0;
    
    always@(posedge clk)
        if (!bubbleE) 
        begin
            if (flushE)
                PC_EX <= 0;
            else 
                PC_EX <= PC_ID;
        end
    
endmodule