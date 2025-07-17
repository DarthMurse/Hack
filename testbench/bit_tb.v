`timescale 1ns/1ps
module bit_tb;
    reg in, load, clk;
    wire out;

    bit uut (
        .in(in), .load(load), .clk(clk), .out(out)
    );

    localparam CLOCK_PERIOD = 20; // Define clock period for clarity
    always #(CLOCK_PERIOD / 2) clk = ~clk; // Generate clock signal
    reg [0: 3] expected_out;
    integer i;
    reg [1:0] test_vec[0:3]; // {in, load}

    initial begin
        // Test sequence: in, load
        clk = 0;
        test_vec[0] = 2'b01; // load, 0
        test_vec[1] = 2'b10; // no load, 0
        test_vec[2] = 2'b11; // load, 1
        test_vec[3] = 2'b00; // no load, 0
        expected_out = 4'b0011;
        $display("Testing bit module:");
        $display("in load clk | out | exp_out | Result");
        for (i = 0; i < 4; i = i + 1) begin
            in = test_vec[i][1];
            load = test_vec[i][0];
            #CLOCK_PERIOD;
            $display("%b   %b    %b  |  %b  |   %b    | %s", in, load, clk, out, expected_out[i], (out === expected_out[i]) ? "PASS" : "FAIL");
        end
        $finish;
    end
endmodule
