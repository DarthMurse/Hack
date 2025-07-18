`timescale 1ns/1ps
module pc_tb;
    reg [15:0] in;
    reg load, inc, reset, clk;
    wire [15:0] out;

    pc uut (
        .in(in), .load(load), .inc(inc), .reset(reset), .clk(clk), .out(out)
    );

    reg [15:0] expected_out;
    //always #5 clk = ~clk; // Clock generator
    integer i;

    initial begin
        expected_out = 0;
        //clk = 0;
        $display("Testing pc module:");
        $display("in      load inc reset clk | out     | exp_out | Result");
        // Reset
        in = 16'h0000; load = 0; inc = 0; reset = 1; clk = 0; #5;
        clk = 1; #5;
        expected_out = 0;
        $display("%h   %b    %b   %b     %b  | %h   |  %h    | %s", in, load, inc, reset, clk, out, expected_out, (out === expected_out) ? "PASS" : "FAIL");
        // Load
        in = 16'h1234; load = 1; inc = 0; reset = 0; clk = 0; #5;
        clk = 1; #5;
        expected_out = 16'h1234;
        $display("%h   %b    %b   %b     %b  | %h   |  %h    | %s", in, load, inc, reset, clk, out, expected_out, (out === expected_out) ? "PASS" : "FAIL");
        // Inc
        in = 16'h0000; load = 0; inc = 1; reset = 0; clk = 0; #5;
        clk = 1; #5;
        expected_out = expected_out + 1;
        $display("%h   %b    %b   %b     %b  | %h   |  %h    | %s", in, load, inc, reset, clk, out, expected_out, (out === expected_out) ? "PASS" : "FAIL");
        // Hold
        in = 16'h0000; load = 0; inc = 0; reset = 0; clk = 0; #5;
        clk = 1; #5;
        $display("%h   %b    %b   %b     %b  | %h   |  %h    | %s", in, load, inc, reset, clk, out, expected_out, (out === expected_out) ? "PASS" : "FAIL");
        $finish;
    end
endmodule
