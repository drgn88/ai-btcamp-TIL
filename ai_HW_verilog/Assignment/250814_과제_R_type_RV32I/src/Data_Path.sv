`timescale 1ns / 1ps

module Data_Path (
    input logic clk,
    input logic rst,
    input logic [31:0] instr_code,
    input logic RF_wr_en,
    input logic [3:0] alu_ctrl,

    output logic [31:0] instr_mem_addr  //Program Counter Out
);

    logic [31:0] rf_data_1;
    logic [31:0] rf_data_2;
    logic [31:0] alu_result;
    logic [31:0] PC_src_data;
    logic [31:0] PC_out_data;

    assign instr_mem_addr = PC_out_data;

    register_file U_REG_FILE (
        .clk(clk),
        .r_addr_1(instr_code[19:15]),
        .r_addr_2(instr_code[24:20]),
        .wr_addr(instr_code[11:7]),
        .wr_en(RF_wr_en),
        .wr_data(alu_result),

        .r_data_1(rf_data_1),
        .r_data_2(rf_data_2)
    );

    ALU U_ALU (
        .alu_ctrl(alu_ctrl),
        .a(rf_data_1),
        .b(rf_data_2),

        .result(alu_result)
    );

    //Use For Program Counter
    register U_PROGRAM_COUNTER (
        .clk(clk),
        .rst(rst),
        .en (1'b1),        //clk이 들어올때마다 항상 1
        .d  (PC_src_data),

        .q(PC_out_data)
    );

    adder_32b U_PC_ADDER (
        .a(PC_out_data),
        .b(32'd4),

        .y(PC_src_data)
    );

endmodule

module ALU (
    input logic [ 3:0] alu_ctrl,  //10가지 연산
    input logic [31:0] a,
    input logic [31:0] b,

    output logic [31:0] result
);

    logic [31:0] arith_shift_right;
    logic [31:0] signed_lt;
    logic [31:0] unsigned_lt;

    arithmetic_shift_right U_ARITH_SHIFT_RIGHT (
        .a(a),
        .b(b),
        .y(arith_shift_right)
    );
    signed_less_than U_SIGNED_LT (
        .a(a),
        .b(b),
        .y(signed_lt)
    );
    unsigned_less_than U_UNSIGNED_LT (
        .a(a),
        .b(b),
        .y(unsigned_lt)
    );

    always_comb begin
        result = 32'bz;  //Latch 방지용
        case (alu_ctrl)
            4'b0000: result = (a + b);  //add
            4'b0001: result = (a - b);  //sub
            4'b0010: result = (a << b);  //logical shift left
            4'b0011: result = (a >> b);  //logical shift right
            4'b0100: result = arith_shift_right;  //arithmetic shift right
            4'b0101: result = signed_lt;  //less than signed
            4'b0110: result = unsigned_lt;  //less than unsigned
            4'b0111: result = (a ^ b);  //xor
            4'b1000: result = (a | b);  //or
            4'b1001: result = (a & b);  //and
        endcase
    end

endmodule

module register_file (
    input logic clk,
    input logic [4:0] r_addr_1,
    input logic [4:0] r_addr_2,
    input logic [4:0] wr_addr,
    input logic wr_en,
    input logic [31:0] wr_data,

    output logic [31:0] r_data_1,
    output logic [31:0] r_data_2
);

    logic [31:0] mem[0:(2**5-1)];  //2^addr - 1

    //////////////////////////////////TEST용
    initial begin
        for (int i = 0; i < 32; i++) begin
            mem[i] = 10 + i;
        end
        mem[15] = 32'b1111_0000_0000_0000_0000_0000_0000_0000;
    end
    /////////////////////////////////

    always_ff @(posedge clk) begin
        if (wr_en) begin
            mem[wr_addr] <= wr_data;
        end
    end

    assign r_data_1 = (r_addr_1 == 0) ? 0 : mem[r_addr_1];
    assign r_data_2 = (r_addr_2 == 0) ? 0 : mem[r_addr_2];

endmodule

//Use For Program Counter
module register (
    input logic clk,
    input logic rst,
    input logic en,
    input logic [31:0] d,

    output logic [31:0] q
);

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            q <= 0;
        end else begin
            if (en) begin
                q <= d;
            end else begin
                q <= q;
            end
        end
    end

endmodule

module adder_32b (
    input logic [31:0] a,
    input logic [31:0] b,

    output logic [31:0] y
);

    assign y = a + b;

endmodule

module arithmetic_shift_right (
    input logic signed [31:0] a,
    input logic signed [31:0] b,

    output logic signed [31:0] y
);

    assign y = (a >>> b);

endmodule

module unsigned_less_than (
    input logic [31:0] a,
    input logic [31:0] b,

    output logic [31:0] y
);

    assign y = (a < b) ? 1 : 0;

endmodule

module signed_less_than (
    input logic signed [31:0] a,
    input logic signed [31:0] b,

    output logic [31:0] y
);

    assign y = (a < b) ? 1 : 0;

endmodule
