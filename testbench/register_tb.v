`timescale 1ns/1ps
module register_tb;
    reg [15:0] in;
    reg load, clk;
    wire [15:0] out;

    register uut (
        .in(in), .load(load), .clk(clk), .out(out)
    );

    reg [15:0] expected_out;
    integer i;

    // Clock generator
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        expected_out = 0;
        $display("Testing register module:");
        $display("time  in      load | out     | exp_out | Result");

        // Test 1: No load, should hold 0
        in = 16'h0000; load = 1; #10;
        $display("%4t %h   %b   | %h   |  %h    | %s", $time, in, load, out, expected_out, (out === expected_out) ? "PASS" : "FAIL");

        // Test 2: Load 0x1234
        in = 16'h1234; load = 1; #10;
        expected_out = 16'h1234;
        $display("%4t %h   %b   | %h   |  %h    | %s", $time, in, load, out, expected_out, (out === expected_out) ? "PASS" : "FAIL");

        // Test 3: No load, should hold previous value
        in = 16'h5678; load = 0; #10;
        $display("%4t %h   %b   | %h   |  %h    | %s", $time, in, load, out, expected_out, (out === expected_out) ? "PASS" : "FAIL");

        // Test 4: Load 0xABCD
        in = 16'hABCD; load = 1; #10;
        expected_out = 16'hABCD;
        $display("%4t %h   %b   | %h   |  %h    | %s", $time, in, load, out, expected_out, (out === expected_out) ? "PASS" : "FAIL");

        $finish;
    end
endmodule
