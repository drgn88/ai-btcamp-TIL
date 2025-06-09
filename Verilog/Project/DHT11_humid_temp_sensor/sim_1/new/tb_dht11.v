`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/29 14:28:53
// Design Name: 
// Module Name: tb_dht11
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


module tb_dht11 ();

    parameter US = 1000;

    reg clk;
    reg rst;
    reg start;
    reg dht11_io_reg;
    reg io_en;
    reg [39:0] dht11_test_data;


    wire w_tick;
    wire [7:0] rh_data;
    wire [7:0] temp_data;
    wire dht11_done;
    wire [2:0] state_led;
    wire dht11_valid;
    wire dht11_io;

    tick_gen DUT0 (
        .clk(clk),
        .rst(rst),

        .o_tick(w_tick)
    );


    dht11_ctrl DUT1 (
        .clk(clk),
        .rst(rst),
        .i_tick(w_tick),
        .start(start),

        .rh_data(rh_data),
        .temp_data(temp_data),
        .dht11_done(dht11_done),
        .state_led(state_led),
        .dht11_valid(dht11_valid),     //check sum

        .dht11_io(dht11_io)
    );

    assign dht11_io = (io_en) ? 1'bz : dht11_io_reg;

    initial begin
        clk = 1'b0;
        forever begin
            #5 clk = ~clk;
        end
    end

    integer i;

    initial begin
        #0;
        rst = 1;
        start = 0;
        dht11_io_reg = 0;
        io_en = 1;
        dht11_test_data = 40'b10101010_00001111_11000110_00000000_01111111;

        #20;
        rst = 0;

        #20;
        start = 1;
        #20;
        start = 0;

        wait (!dht11_io);
        wait (dht11_io);

        #(30 * US);  // 30usec
        io_en = 0;
        dht11_io_reg = 0;

        #(80 * US);
        dht11_io_reg = 1;
        #(80 * US);
        for (i = 0; i < 40; i = i + 1) begin
            dht11_io_reg = 0;
            #(50 * US);  //data sync
            if (dht11_test_data[39-i] == 0) begin
                dht11_io_reg = 1;
                #(29 * US);
            end else begin
                dht11_io_reg = 1;
                #(68 * US);
            end
        end
        dht11_io_reg = 0;
        #(50 * US);

        io_en = 1;

        #50000;
        $stop;
    end

endmodule
