`timescale 1ns / 1ps

module FND_CTRL (
    input clk,
    input rst,
    input [13:0] number,

    output logic [3:0] fnd_com,
    output logic [7:0] fnd_font
);

    logic w_tick_1khz;
    logic [1:0] w_counter_2b;

    logic [3:0] digit_1;
    logic [3:0] digit_10;
    logic [3:0] digit_100;
    logic [3:0] digit_1000;

    logic [3:0] bcd_val;

    clk_div_1khz U_CLK_DIV_1KHZ (
        .clk(clk),
        .rst(rst),

        .tick_1khz(w_tick_1khz)
    );

    cnt_2b U_CNT_2B (
        .clk (clk),
        .rst (rst),
        .tick(w_tick_1khz),

        .counter_2b(w_counter_2b)
    );

    decoder_2x4 U_DECODE_2to4 (
        .x(w_counter_2b),

        .y(fnd_com)
    );

    digit_splitter U_DIGIT_SPLIT (
        .number(number),

        .digit_1(digit_1),
        .digit_10(digit_10),
        .digit_100(digit_100),
        .digit_1000(digit_1000)
    );

    mux_4to1 MUX_4to1(
        .sel(w_counter_2b),
        .x_0(digit_1),
        .x_1(digit_10),
        .x_2(digit_100),
        .x_3(digit_1000),

        .y(bcd_val)
    );

    bcd_2_FND_decoder BCD_2_FND (
        .bcd(bcd_val),

        .fnd_font(fnd_font)
    );

endmodule


module clk_div_1khz (
    input clk,
    input rst,

    output logic tick_1khz
);

    localparam FCNT = 10_0000;  // 1kHz

    logic [($clog2(FCNT) - 1):0] div_counter;

    always_ff @(posedge clk or posedge rst) begin : tick_generator
        if (rst) begin
            tick_1khz   <= 1'b0;
            div_counter <= 1'b0;
        end else if (div_counter == (FCNT - 1)) begin
            tick_1khz   <= 1'b1;
            div_counter <= 1'b0;
        end else begin
            tick_1khz   <= 1'b0;
            div_counter <= div_counter + 1'b1;
        end
    end

endmodule

module cnt_2b (
    input clk,
    input rst,
    input tick,

    output logic [1:0] counter_2b
);

    always_ff @(posedge clk or posedge rst) begin : counter_2bit
        if (rst) begin
            counter_2b <= 0;
        end else begin
            if (tick) begin
                counter_2b <= counter_2b + 1;
            end
        end
    end

endmodule

module decoder_2x4 (
    input [1:0] x,

    output logic [3:0] y
);

    always_comb begin : select_fnd_com
        //fnd_com = 4'b1111;              // Latch 방지용 default value
        case (x)
            2'b00: y = 4'b1110;
            2'b01: y = 4'b1101;
            2'b10: y = 4'b1011;
            2'b11: y = 4'b0111;
        endcase
    end

endmodule

module digit_splitter (
    input [13:0] number,

    output logic [3:0] digit_1,
    output logic [3:0] digit_10,
    output logic [3:0] digit_100,
    output logic [3:0] digit_1000
);


    assign digit_1 = (number % 10);
    assign digit_10 = ((number / 10) % 10);
    assign digit_100 = ((number / 100) % 10);
    assign digit_1000 = (number / 1000);

endmodule


module mux_4to1 (
    input [1:0] sel,
    input [3:0] x_0,
    input [3:0] x_1,
    input [3:0] x_2,
    input [3:0] x_3,

    output logic [3:0] y
);

    always_comb begin : select_digit
        //y = 4'd0; // Latch 방지용
        case (sel)
            2'd0: y = x_0;
            2'd1: y = x_1;
            2'd2: y = x_2;
            2'd3: y = x_3;
        endcase
    end

endmodule

module bcd_2_FND_decoder (
    input [3:0] bcd,

    output logic [7:0] fnd_font
);

    always_comb begin
        case (bcd)
            4'd0: fnd_font = 8'hC0;
            4'd1: fnd_font = 8'hF9;
            4'd2: fnd_font = 8'hA4;
            4'd3: fnd_font = 8'hB0;
            4'd4: fnd_font = 8'h99;
            4'd5: fnd_font = 8'h92;
            4'd6: fnd_font = 8'h82;
            4'd7: fnd_font = 8'hF8;
            4'd8: fnd_font = 8'h80;
            4'd9: fnd_font = 8'h90;
            default: fnd_font = 8'hFF;
        endcase
    end

endmodule
