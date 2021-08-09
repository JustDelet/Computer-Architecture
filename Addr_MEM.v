`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: USTC ESLAB
// Engineer: Huang Yifan (hyf15@mail.ustc.edu.cn)
// 
// Design Name: RV32I Core
// Module Name: Register Address seg reg
// Tool Versions: Vivado 2017.4.1
// Description: Register address seg reg for EX\MEM
// 
//////////////////////////////////////////////////////////////////////////////////


//  ����˵��
    // EX\MEM�ļĴ�����ַ�μĴ�������������Դ�Ĵ�����һ��Ŀ��Ĵ����ĵ�ַ
// ����
    // clk               ʱ���ź�
    // reg_dest_EX       EX�׶ε�Ŀ��Ĵ�����ַ
    // bubbleM           MEM�׶ε�bubble�ź�
    // flushM            MEM�׶ε�flush�ź�
// ���
    // reg_dest_MEM       ������һ��ˮ�ε�Ŀ��Ĵ�����ַ
// ʵ��Ҫ��  
    // �����޸�

module Addr_MEM(
    input wire clk, bubbleM, flushM,
    input wire [4:0] reg_dest_EX,
    output reg [4:0] reg_dest_MEM
    );

    initial reg_dest_MEM = 0;
    
    always@(posedge clk)
        if (!bubbleM) 
        begin
            if (flushM)
                reg_dest_MEM <= 0;
            else 
                reg_dest_MEM <= reg_dest_EX;
        end
    
endmodule
