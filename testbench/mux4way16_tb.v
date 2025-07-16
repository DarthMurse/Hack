`timescale 1ns/1ps
module mux4way16_tb;
    reg [15:0] a, b, c, d;
    reg [1:0] sel;
    wire [15:0] out;

    mux4way16 uut (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .sel(sel),
        .out(out)
    );

    initial begin
        $display("Testing mux4way16");
        a = 16'h0001; b = 16'h0002; c = 16'h0004; d = 16'h0008;
        // Test 1
        sel = 2'b00; #10;
        if (out !== a)
            $display("FAIL: sel=%b out=%h expected=%h", sel, out, a);
        else
            $display("PASS: sel=%b out=%h", sel, out);
        // Test 2
        sel = 2'b01; #10;
        if (out !== b)
            $display("FAIL: sel=%b out=%h expected=%h", sel, out, b);
        else
            $display("PASS: sel=%b out=%h", sel, out);
        // Test 3
        sel = 2'b10; #10;
        if (out !== c)
            $display("FAIL: sel=%b out=%h expected=%h", sel, out, c);
        else
            $display("PASS: sel=%b out=%h", sel, out);
        // Test 4
        sel = 2'b11; #10;
        if (out !== d)
            $display("FAIL: sel=%b out=%h expected=%h", sel, out, d);
        else
            $display("PASS: sel=%b out=%h", sel, out);
        $finish;
    end
endmodule
