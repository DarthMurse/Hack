`timescale 1ns/1ps
module not16_tb;
    reg [15:0] in;
    wire [15:0] out;

    not16 uut (
        .in(in),
        .out(out)
    );

    initial begin
        $display("Testing not16");
        // Test 1
        in = 16'h0000; #10;
        if (out !== ~in)
            $display("FAIL: in=%h out=%h expected=%h", in, out, ~in);
        else
            $display("PASS: in=%h out=%h", in, out);
        // Test 2
        in = 16'hFFFF; #10;
        if (out !== ~in)
            $display("FAIL: in=%h out=%h expected=%h", in, out, ~in);
        else
            $display("PASS: in=%h out=%h", in, out);
        // Test 3
        in = 16'hA5A5; #10;
        if (out !== ~in)
            $display("FAIL: in=%h out=%h expected=%h", in, out, ~in);
        else
            $display("PASS: in=%h out=%h", in, out);
        $finish;
    end
endmodule
