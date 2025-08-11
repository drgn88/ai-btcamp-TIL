`timescale 1ns / 1ps

module Data_Path (
    input logic clk,
    input logic rst,
    input logic A_Mux_Sel,
    input logic A_En,
    input logic Acc_Mux_Sel,
    input logic Acc_En,
    input logic Out_Buf_En,

    output logic ALe10,
    output logic [7:0] out_acc_sum
);
    /**************************** REG A ****************************/
    logic [7:0] A_Mux_Out;
    logic [7:0] A_Reg_Out;
    logic [7:0] A_Sum_Out;

    mux_2x1 U_MUX_A_REG (
        .sel(A_Mux_Sel),
        .a  (8'd0),
        .b  (A_Sum_Out),

        .mux_out(A_Mux_Out)
    );

    register U_REG_A (
        .clk(clk),
        .rst(rst),
        .en (A_En),
        .d  (A_Mux_Out),


        .q(A_Reg_Out)
    );

    adder_8b U_ADD_REG_A (
        .a(8'd1),
        .b(A_Reg_Out),

        .sum(A_Sum_Out)
    );

    comparator U_CMP_LE10 (
        .x0(A_Reg_Out),
        .x1(8'd10),

        .y(ALe10)
    );

    /**************************** REG ACC SUM ****************************/

    logic [7:0] Acc_Mux_Out;
    logic [7:0] Acc_Reg_Out;
    logic [7:0] Acc_Sum_Out;

    mux_2x1 U_MUX_ACC_REG (
        .sel(Acc_Mux_Sel),
        .a  (8'd0),
        .b  (Acc_Sum_Out),

        .mux_out(Acc_Mux_Out)
    );

    register U_REG_ACC (
        .clk(clk),
        .rst(rst),
        .en (Acc_En),
        .d  (Acc_Mux_Out),


        .q(Acc_Reg_Out)
    );

    adder_8b U_ADD_REG_ACC (
        .a(A_Reg_Out),
        .b(Acc_Reg_Out),

        .sum(Acc_Sum_Out)
    );



    /**************************** OUTPUT ****************************/

    // out_buffer U_OUT_BUFFER (
    //     .Out_Buf_En(Out_Buf_En),
    //     .in_data(Acc_Sum_Out),

    //     .out_data(out_acc_sum)
    // );

    register U_REG_OUT (
        .clk(clk),
        .rst(rst),
        .en (Out_Buf_En),
        .d  (Acc_Reg_Out),


        .q(out_acc_sum)
    );

endmodule

module register (
    input logic clk,
    input logic rst,
    input logic en,
    input logic [7:0] d,


    output logic [7:0] q
);

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            q <= 0;
        end else if (en) begin
            q <= d;
        end else begin
            q <= q;
        end
    end

endmodule

module comparator (
    input logic [7:0] x0,
    input logic [7:0] x1,

    output logic y
);

    assign y = (x0 <= x1);

endmodule

module adder_8b (
    input logic [7:0] a,
    input logic [7:0] b,

    output logic [7:0] sum
);

    assign sum = a + b;

endmodule

module mux_2x1 (
    input logic sel,
    input logic [7:0] a,
    input logic [7:0] b,

    output logic [7:0] mux_out
);

    assign mux_out = (!sel) ? a : b;

endmodule

module out_buffer (
    input logic Out_Buf_En,
    input logic [7:0] in_data,

    output logic [7:0] out_data
);

    assign out_data = (Out_Buf_En) ? in_data : 8'bz;

endmodule
