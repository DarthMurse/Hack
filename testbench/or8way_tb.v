`timescale 1ns/1ps
module or8way_tb;
    reg [7:0] in;
    wire out;

    or8way uut (
        .in(in),
        .out(out)
    );

    initial begin
        $display("Testing or8way");
        // Test 1
        in = 8'b00000000; #10;
        if (out !== 1'b0)
            $display("FAIL: in=%b out=%b expected=0", in, out);
        else
            $display("PASS: in=%b out=%b", in, out);
        // Test 2
        in = 8'b00000001; #10;
        if (out !== 1'b1)
            $display("FAIL: in=%b out=%b expected=1", in, out);
        else
            $display("PASS: in=%b out=%b", in, out);
        // Test 3
        in = 8'b11111111; #10;
        if (out !== 1'b1)
            $display("FAIL: in=%b out=%b expected=1", in, out);
        else
            $display("PASS: in=%b out=%b", in, out);
        // Test 4
        in = 8'b10101010; #10;
        if (out !== 1'b1)
            $display("FAIL: in=%b out=%b expected=1", in, out);
        else
            $display("PASS: in=%b out=%b", in, out);
        $finish;
    end
endmodule
