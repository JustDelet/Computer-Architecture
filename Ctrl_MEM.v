`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: USTC ESLAB
// Engineer: Huang Yifan (hyf15@mail.ustc.edu.cn)
// 
// Design Name: Ctrl_MEM
// Module Name: Control Signal Seg Reg
// Tool Versions: Vivado 2017.4.1
// Description: Control signal seg reg for EX\MEM
// 
//////////////////////////////////////////////////////////////////////////////////


//  ����˵��
    // EX\MEM�Ŀ����źŶμĴ���?
// ����
    // clk                  ʱ���ź�
    // wb_select_EX         д�ؼĴ�����ֵ����Դ��Cache���ݻ���ALU��������
    // load_type_EX         load����
    // reg_write_en_EX      ͨ�üĴ���дʹ��
    // cache_write_en_EX    ���ֽ�д��data cache
    // bubbleM              EX�׶ε�bubble�ź�
    // flushM               EX�׶ε�flush�ź�
// ���
    // wb_select_MEM        ������һ��ˮ�ε�д�ؼĴ�����ֵ����Դ��Cache���ݻ���ALU��������
    // load_type_MEM        ������һ��ˮ�ε�load����
    // reg_write_en_MEM     ������һ��ˮ�ε�ͨ�üĴ���дʹ��
    // cache_write_en_MEM   ������һ��ˮ�εİ��ֽ�д��data cache

// ʵ��Ҫ��  
    // �����޸�



module Ctrl_MEM(
    input wire clk, bubbleM, flushM,
    input wire wb_select_EX,
    input wire [2:0] load_type_EX,
    input wire reg_write_en_EX,
    input wire [3:0] cache_write_en_EX,
    output reg wb_select_MEM,
    output reg [2:0] load_type_MEM,
    output reg reg_write_en_MEM,
    output reg [3:0] cache_write_en_MEM
    );

    initial 
    begin
        wb_select_MEM = 0;
        load_type_MEM = 2'h0;
        reg_write_en_MEM = 0;
        cache_write_en_MEM = 3'h0;
    end
    
    always@(posedge clk)
        if (!bubbleM) 
        begin
            if (flushM)
            begin
                wb_select_MEM <= 0;
                load_type_MEM <= 2'h0;
                reg_write_en_MEM <= 0;
                cache_write_en_MEM <= 3'h0;
            end
            else
            begin
                wb_select_MEM <= wb_select_EX;
                load_type_MEM <= load_type_EX;
                reg_write_en_MEM <= reg_write_en_EX;
                cache_write_en_MEM <= cache_write_en_EX;
            end
        end
    
endmodule