`timescale 1ns / 1ps

module btn_detector (
    input clk,
    input rst,
    input btn,

    output logic rising_edge_detector,
    output logic falling_edge_detector,
    output logic both_edge_detector
);

    logic [7:0] out_data;
    logic debounce;
    logic clk_1khz;

    clk_div_1khz CLK_DIV_1KHZ(
    .clk(clk),
    .rst(rst),
    
    .clk_1khz(clk_1khz)
);

    shift_reg SHIFT_REG (
        .clk(clk_1khz),
        .rst(rst),
        .in_data(btn),

        .out_data(out_data)
    );

    assign debounce = &out_data;
    // assign out_btn = &out_data;      //TestBench용

    edge_detector EDGE_DETECT (
        .clk (clk),
        .rst (rst),
        .data(debounce),

        .rising_edge_detector(rising_edge_detector),
        .falling_edge_detector(falling_edge_detector),
        .both_edge_detector(both_edge_detector)
    );

endmodule

module shift_reg (
    input clk,
    input rst,
    input in_data,

    output logic [7:0] out_data
);

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            out_data <= 8'b0;
        end else begin
            out_data <= {in_data, out_data[7:1]};  // Shift Right
            //    out_data <= { out_data[6:0], in_data};        // Shift Left
        end
    end

endmodule


module edge_detector (
    input clk,
    input rst,
    input data,

    output logic rising_edge_detector,
    output logic falling_edge_detector,
    output logic both_edge_detector
);

    logic [1:0] edge_reg;  // 첫번째 f/f는 glitch 방지용

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            edge_reg <= 0;
        end else begin
            edge_reg[0] <= data;
            edge_reg[1] <= edge_reg[0];
        end
    end

    assign rising_edge_detector = (edge_reg[0] & (~edge_reg[1]));      //나가는 신호 NOT --> Rising Edge
    assign falling_edge_detector = (~edge_reg[0] & (edge_reg[1]));     //들어오는 신호 NOT --> Falling Edge
    assign both_edge_detector = (rising_edge_detector | falling_edge_detector);
endmodule


module clk_div_1khz (
    input clk,
    input rst,
    
    output logic clk_1khz
);
    localparam FCNT = 100_000;

    logic [($clog2(FCNT) - 1) : 0] cnt;

    always_ff @( posedge clk or posedge rst ) begin
        if(rst) begin
            cnt <= 0;
            clk_1khz <= 0;
        end
        else if(cnt == (FCNT - 1)) begin
            cnt <= 0;
            clk_1khz <= 1;
        end
        else begin
            cnt <= cnt + 1;
            clk_1khz <= 0;
        end
    end
endmodule