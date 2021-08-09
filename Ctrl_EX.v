`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: USTC ESLAB
// Engineer: Huang Yifan (hyf15@mail.ustc.edu.cn)
// 
// Design Name: RV32I Core
// Module Name: Control Signal Seg Reg
// Tool Versions: Vivado 2017.4.1
// Description: Control signal seg reg for ID\EX
// 
//////////////////////////////////////////////////////////////////////////////////


//  ����˵��
    // ID\EX�Ŀ����źŶμĴ�??
// ����
    // clk                  ʱ���ź�
    // jalr_ID              jalr��תָ��
    // ALU_func_ID          ALUִ�е�������??
    // br_type_ID           branch���ж������������ǲ�����branch
    // load_npc_ID          д�ؼĴ�����ֵ����Դ��PC��???ALU������??
    // wb_select_ID         д�ؼĴ�����ֵ����Դ��Cache���ݻ�???ALU������??
    // load_type_ID         load����
    // src_reg_en_ID        ָ����src reg�ĵ�??�Ƿ���Ч
    // reg_write_en_ID      ͨ�üĴ���дʹ��
    // cache_write_en_ID    ���ֽ�д��data cache
    // alu_src1_ID          alu����??1��Դ��alu_src1 == 0��ʾ����reg1��alu_src1 == 1��ʾ����PC
    // alu_src2_ID          alu����??2��Դ��alu_src2 == 2��b00��ʾ����reg2��alu_src2 == 2'b01��ʾ����reg2��ַ��alu_src2 == 2'b10��ʾ��������??
    // bubbleE              EX�׶ε�bubble�ź�
    // flushE               EX�׶ε�flush�ź�
// ���
    // jalr_EX              ������һ��ˮ�ε�jalr��תָ��
    // ALU_func_EX          ������һ��ˮ�ε�ALUִ�е�������??
    // br_type_EX           ������һ��ˮ�ε�branch���ж������������ǲ�����branch
    // load_npc_EX          ������һ��ˮ�ε�д�ؼĴ�����ֵ����Դ��PC��???ALU������??
    // wb_select_EX         ������һ��ˮ�ε�д�ؼĴ�����ֵ����Դ��Cache���ݻ�???ALU������??
    // load_type_EX         ������һ��ˮ�ε�load����
    // src_reg_en_EX        ������һ��ˮ�ε�ָ����src reg�ĵ�??�Ƿ���Ч
    // reg_write_en_EX      ������һ��ˮ�ε�ͨ�üĴ���дʹ��
    // cache_write_en_EX    ������һ��ˮ�εİ��ֽ�д��data cache
    // alu_src1_EX          ������һ��ˮ�ε�alu����??1��Դ
    // alu_src2_EX          ������һ��ˮ�ε�alu����??2��Դ

// ʵ��Ҫ��  
    // �����޸�




module Ctrl_EX(
    input wire clk, bubbleE, flushE,
    input wire jalr_ID,
    input wire [3:0] ALU_func_ID,
    input wire [2:0] br_type_ID,
    input wire load_npc_ID,
    input wire wb_select_ID,
    input wire [2:0] load_type_ID,
    input wire reg_write_en_ID,
    input wire [3:0] cache_write_en_ID,
    input wire op1_src_ID, op2_src_ID, 
    output reg jalr_EX,
    output reg [3:0] ALU_func_EX,
    output reg [2:0] br_type_EX,
    output reg load_npc_EX,
    output reg wb_select_EX,
    output reg [2:0] load_type_EX,
    output reg reg_write_en_EX,
    output reg [3:0] cache_write_en_EX,
    output reg op1_src_EX, op2_src_EX
    );

    initial 
    begin
        jalr_EX = 0;
        ALU_func_EX = 4'h0;
        br_type_EX = 3'h0;
        load_npc_EX = 0;
        wb_select_EX = 0;
        load_type_EX = 2'h0;
        reg_write_en_EX = 0;
        cache_write_en_EX = 3'h0;
        op1_src_EX = 0;
        op2_src_EX = 0;
        
    end
    
    always@(posedge clk)
        if (!bubbleE) 
        begin
            if (flushE)
            begin
                jalr_EX <= 0;
                ALU_func_EX <= 4'h0;
                br_type_EX <= 3'h0;
                load_npc_EX <= 0;
                wb_select_EX <= 0;
                load_type_EX <= 2'h0;
                reg_write_en_EX <= 0;
                cache_write_en_EX <= 3'h0;
                op1_src_EX <= 0;
                op2_src_EX <= 0;
            end
            else
            begin
                jalr_EX <= jalr_ID;
                ALU_func_EX <= ALU_func_ID;
                br_type_EX <= br_type_ID;
                load_npc_EX <= load_npc_ID;
                wb_select_EX <= wb_select_ID;
                load_type_EX <= load_type_ID;
                reg_write_en_EX <= reg_write_en_ID;
                cache_write_en_EX <= cache_write_en_ID;
                op1_src_EX <= op1_src_ID;
                op2_src_EX <= op2_src_ID;
            end
        end
    
endmodule
