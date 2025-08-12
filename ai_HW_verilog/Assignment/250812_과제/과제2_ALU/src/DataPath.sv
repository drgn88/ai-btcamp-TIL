`timescale 1ns / 1ps

module DataPath (
    input logic clk,
    input logic rst,
    input logic RF_Src_Mux_Sel,

    input logic [2:0] r_addr_1,
    input logic [2:0] r_addr_2,
    input logic [2:0] wr_addr,
    input logic wr_en,
    input logic [1:0] opcode,
    input logic outport_en,

    output logic lt,
    output logic [7:0] OutPort
);

    logic [7:0] ALU_Src_Out;
    logic [7:0] RF_Mux_Out;
    logic [7:0] r_data_1, r_data_2;

    mux_2x1 U_REG_SRC_MUX (
        .sel(RF_Src_Mux_Sel),
        .a  (ALU_Src_Out),
        .b  (8'd1),

        .mux_out(RF_Mux_Out)
    );

    register_file U_REG_FILE (
        .clk(clk),
        .r_addr_1(r_addr_1),
        .r_addr_2(r_addr_2),
        .wr_addr(wr_addr),
        .wr_en(wr_en),
        .wr_data(RF_Mux_Out),

        .r_data_1(r_data_1),
        .r_data_2(r_data_2)
    );

    ALU U_ALU (
        .opcode(opcode),
        .x0(r_data_1),
        .x1(r_data_2),

        .y(ALU_Src_Out)
    );

    comparator U_CMP_R1_R2 (
        .x0(r_data_1),
        .x1(r_data_2),

        .y(lt)
    );

    register U_OUT_PORT (
        .clk(clk),
        .rst(rst),
        .en (outport_en),
        .d  (r_data_1),


        .q(OutPort)
    );


endmodule

module ALU (
    input logic [1:0] opcode,
    input logic [7:0] x0,
    input logic [7:0] x1,

    output logic [7:0] y
);

    always_comb begin
        case (opcode)
            2'b00: y = (x0 + x1);
            2'b01: y = (x0 - x1);
            2'b10: y = (x0 & x1);
            2'b11: y = (x0 | x1);
        endcase
    end

endmodule

// Register file은 Reset이 없다
module register_file (
    input logic clk,
    input logic [2:0] r_addr_1,
    input logic [2:0] r_addr_2,
    input logic [2:0] wr_addr,
    input logic wr_en,
    input logic [7:0] wr_data,

    output logic [7:0] r_data_1,
    output logic [7:0] r_data_2
);

    logic [7:0] mem[0:(2**3-1)];  //2^addr - 1

    always_ff @(posedge clk) begin
        if (wr_en) begin
            mem[wr_addr] <= wr_data;
        end
    end

    assign r_data_1 = (r_addr_1 == 0) ? 0 : mem[r_addr_1];
    assign r_data_2 = (r_addr_2 == 0) ? 0 : mem[r_addr_2];

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

    assign y = (x0 < x1);

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
