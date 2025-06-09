`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/28 10:29:04
// Design Name: 
// Module Name: tb_w_professor
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_w_professor ();

    reg clk;
    reg rst;
    reg btn_start;
    reg rx_data;
    reg send_data;
    reg [7:0] rx_send_data, rand_data;

    wire tx;
    wire tx_busy;
    wire tx_done;
    wire w_tick;
    wire [7:0] o_rx_dout;
    wire o_rx_done;

    UART_tx DUT_TX (
        .clk(clk),
        .rst(rst),
        .baud_tick(w_tick),
        .start(btn_start),
        .din(o_rx_dout),

        .o_tx(tx),
        .o_tx_done(tx_done),
        .o_tx_busy(tx_busy)
    );

    uart_rx DUT_RX (
        .clk(clk),
        .rst(rst),
        .rx_data(rx_data),
        .baud_tick(w_tick),

        .o_dout(o_rx_dout),
        .o_rx_done(o_rx_done)
    );

    baudrate DUT_BD (
        .clk(clk),
        .rst(rst),
        .baud_tick(w_tick)
    );

    initial begin
        clk = 1'b0;
        forever begin
            #5 clk = ~clk;
        end
    end

    integer i, j;

    initial begin
        #0;
        rst = 1;
        rx_data = 1;

        #10;
        rst = 0;

        #5;
        btn_start = 1;

        #5;
        btn_start = 0;

        rx_data   = 0;  //START
        #104160;
        rx_data = 0;  //d0
        #104160;
        rx_data = 1;
        #104160;
        rx_data = 0;
        #104160;
        rx_data = 0;
        #104160;
        rx_data = 1;
        #104160;
        rx_data = 1;
        #104160;
        rx_data = 0;
        #104160;
        rx_data = 0;
        #104160;

        rx_data = 1;

        wait (tx_done);

        #100;
        rx_send_data = 8'h30;

        for (j = 0; j < 8; j = j + 1) begin
            rand_data = $random(255);
            rx_send_data = rand_data;
            send_data_to_rx(rx_send_data + j);
            wait_for_rx();
        end

        $stop;
    end



    //
    task send_data_to_rx(input [7:0] send_data);
        begin
            //start bit
            rx_data = 0;
            #(10416 * 10);
            //rx data lsb transfer
            for (i = 0; i < 8; i = i + 1) begin
                rx_data = send_data[i];
                #(10416 * 10);
            end
            rx_data = 1;
            #(10416 * 3);
            $display("send_data = %h", send_data);
        end
    endtask

    //rx: 수신 완시 검사기
    task wait_for_rx();
        begin
            wait (o_rx_done);
            if (o_rx_dout == rx_send_data) begin
                //pass
                $display("PASS!! rx_data = %h", o_rx_dout);
            end else begin
                //fail
                $display("FAIL!! o_rx_dout = %h", rx_data);
            end
            $display("rx_data = %h", o_rx_dout);
        end
    endtask
endmodule
