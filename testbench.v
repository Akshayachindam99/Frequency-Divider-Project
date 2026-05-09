Test Bench:
module tb_freq_div_by_3;

    reg clk;
    reg rst;
    reg enable;
    wire clk_out;

    // Instantiate DUT
    freq_div_by_3 uut (
        .clk(clk),
        .rst(rst),
        .enable(enable),
        .clk_out(clk_out)
    );

    // Clock generation (10ns period)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Stimulus
    initial begin
        rst = 1;
        enable = 0;
        #20;

        rst = 0;
        #20 enable = 1;

        #150 enable = 0;
        #50 enable = 1;

        #150 $stop;
    end

    // Monitor
    initial begin
        $monitor("time=%0t clk=%b enable=%b clk_out=%b",
                  $time, clk, enable, clk_out);
    end

endmodule
