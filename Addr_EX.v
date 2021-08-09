`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: USTC ESLAB
// Engineer: Huang Yifan (hyf15@mail.ustc.edu.cn)
// 
// Design Name: RV32I Core
// Module Name: Register Address seg reg
// Tool Versions: Vivado 2017.4.1
// Description: Register address seg reg for ID\EX
// 
//////////////////////////////////////////////////////////////////////////////////


//  ����˵��
    // ID\EX�ļĴ�����ַ�μĴ�������������Դ�Ĵ�����һ��Ŀ��Ĵ����ĵ�ַ
// ����
    // clk               ʱ���ź�
    // reg1_src_ID       ID�׶ε�Դ�Ĵ���1��ַ
    // reg2_src_ID       ID�׶ε�Դ�Ĵ���2��ַ
    // reg_dest_ID       ID�׶ε�Ŀ��Ĵ�����ַ
    // bubbleE           EX�׶ε�bubble�ź�
    // flushE            EX�׶ε�flush�ź�
// ���
    // reg1_src_EX       ������һ��ˮ�ε�Դ�Ĵ���1��ַ
    // reg2_src_EX       ������һ��ˮ�ε�Դ�Ĵ���2��ַ
    // reg_dest_EX       ������һ��ˮ�ε�Ŀ��Ĵ�����ַ
// ʵ��Ҫ��  
    // �����޸�

module Addr_EX(
    input wire clk, bubbleE, flushE,
    input wire [4:0] reg1_src_ID, reg2_src_ID, reg_dest_ID,
    output reg [4:0] reg1_src_EX, reg2_src_EX, reg_dest_EX
    );

    initial 
    begin
        reg1_src_EX = 0;
        reg2_src_EX = 0;
        reg_dest_EX = 0;
    end
    
    always@(posedge clk)
        if (!bubbleE) 
        begin
            if (flushE)
            begin
                reg1_src_EX <= 0;
                reg2_src_EX <= 0;
                reg_dest_EX <= 0;
            end
            else
            begin
                reg1_src_EX <= reg1_src_ID;
                reg2_src_EX <= reg2_src_ID;
                reg_dest_EX <= reg_dest_ID;
            end
        end
    
endmodule
