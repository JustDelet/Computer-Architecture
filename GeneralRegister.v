`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: USTC ESLAB
// Engineer: Huang Yifan (hyf15@mail.ustc.edu.cn)
// 
// Design Name: RV32I Core
// Module Name: General Register
// Tool Versions: Vivado 2017.4.1
// Description: General Register File
// 
//////////////////////////////////////////////////////////////////////////////////


//  ����˵��
    //  ͨ�üĴ������ṩ��д�˿ڣ�ͬ��д���첽����
    //  ʱ���½���д��
    //  0�żĴ�����ֵʼ��Ϊ0
// ����
    // clk               ʱ���ź�
    // rst               �Ĵ��������ź�
    // write_en          �Ĵ���дʹ��
    // addr1             reg1����ַ
    // addr2             reg2����ַ
    // wb_addr           д�ص�ַ
    // wb_data           д������
// ���
    // reg1              reg1������
    // reg2              reg2������
// ʵ��Ҫ��
    // �����޸�


module RegisterFile(
    input wire clk,
    input wire rst,
    input wire write_en,
    input wire [4:0] addr1, addr2, wb_addr,
    input wire [31:0] wb_data,
    output wire [31:0] reg1, reg2
    );

    reg [31:0] reg_file[31:1];
    integer i;

    // init register file
    initial
    begin
        for(i = 1; i < 32; i = i + 1) 
            reg_file[i][31:0] <= 32'b0;
    end

    // write in clk negedge, reset in rst posedge
    // if write register in clk posedge,
    // new wb data also write in clk posedge,
    // so old wb data will be written to register
    always@(negedge clk or posedge rst) 
    begin 
        if (rst)
            for (i = 1; i < 32; i = i + 1) 
                reg_file[i][31:0] <= 32'b0;
        else if(write_en && (wb_addr != 5'h0))
            reg_file[wb_addr] <= wb_data;   
    end

    // read data changes when address changes
    assign reg1 = (addr1 == 5'b0) ? 32'h0 : reg_file[addr1];
    assign reg2 = (addr2 == 5'b0) ? 32'h0 : reg_file[addr2];




endmodule