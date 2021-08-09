`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: USTC ESLAB
// Engineer: Huang Yifan (hyf15@mail.ustc.edu.cn)
// 
// Design Name: RV32I Core
// Module Name: Computation Result Seg Reg
// Tool Versions: Vivado 2017.4.1
// Description: Computation result seg reg for EX\MEM
// 
//////////////////////////////////////////////////////////////////////////////////


//  ����˵��
    // EX\MEM���������μĴ�����������ALU��������PCֵ
// ����
    // clk               ʱ���ź�
    // result            ALU��������PCֵ
    // bubbleM           MEM�׶ε�bubble�ź�
    // flushM            MEM�׶ε�flush�ź�
// ���
    // result_MEM       ������һ��ˮ�ε�Ŀ��Ĵ�����ַ
// ʵ��Ҫ��  
    // �����޸�

module Result_MEM(
    input wire clk, bubbleM, flushM,
    input wire [31:0] result,
    output reg [31:0] result_MEM
    );

    initial result_MEM = 0;
    
    always@(posedge clk)
        if (!bubbleM) 
        begin
            if (flushM)
                result_MEM <= 32'h0;
            else 
                result_MEM <= result;
        end
    
endmodule
