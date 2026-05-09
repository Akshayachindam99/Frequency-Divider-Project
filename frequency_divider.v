Design code:
   module freq_div_by_3 (
    input wire clk,
    input wire rst,
    input wire enable,
    output wire clk_out
);

    reg [1:0] count_pos;
    reg [1:0] count_neg;
    reg clk_pos;
    reg clk_neg;

    // Positive edge logic
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            count_pos <= 0;
            clk_pos <= 0;
        end else if (enable) begin
            if (count_pos == 2) begin
                count_pos <= 0;
                clk_pos <= ~clk_pos;
            end else begin
                count_pos <= count_pos + 1;
            end
        end
    end

    // Negative edge logic
    always @(negedge clk or posedge rst) begin
        if (rst) begin
            count_neg <= 0;
            clk_neg <= 0;
        end else if (enable) begin
            if (count_neg == 2) begin
                count_neg <= 0;
                clk_neg <= ~clk_neg;
            end else begin
                count_neg <= count_neg + 1;
            end
        end
    end

    // Combine both edges
    assign clk_out = clk_pos ^ clk_neg;

endmodule 
