`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: USTC ESLAB
// Engineer: Huang Yifan (hyf15@mail.ustc.edu.cn)
// 
// Design Name: RV32I Core
// Module Name: PC ID Seg Reg
// Tool Versions: Vivado 2017.4.1
// Description: PC seg reg for IF\ID
// 
//////////////////////////////////////////////////////////////////////////////////


//  ����˵��
    // IF\ID��PC�μĴ���
// ����
    // clk               ʱ���ź�
    // PC_IF             PC�Ĵ���������ָ���ַ
    // bubbleD           ID�׶ε�bubble�ź�
    // flushD            ID�׶ε�flush�ź�
// ���
    // PC_ID             ������һ�μĴ�����PC��ַ
// ʵ��Ҫ��  
    // �����޸�

module PC_ID(
    input wire clk, bubbleD, flushD,
    input wire [31:0] PC_IF,
    output reg [31:0] PC_ID
    );

    initial PC_ID = 0;
    
    always@(posedge clk)
        if (!bubbleD) 
        begin
            if (flushD)
                PC_ID <= 0;
            else 
                PC_ID <= PC_IF;
        end
    
endmodule
