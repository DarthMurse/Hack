`timescale 1ns/1ps
module mux8way16_tb;
    reg [15:0] a, b, c, d, e, f, g, h;
    reg [2:0] sel;
    wire [15:0] out;

    mux8way16 uut (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .e(e),
        .f(f),
        .g(g),
        .h(h),
        .sel(sel),
        .out(out)
    );

    initial begin
        $display("Testing mux8way16");
        a = 16'h0001; b = 16'h0002; c = 16'h0004; d = 16'h0008;
        e = 16'h0010; f = 16'h0020; g = 16'h0040; h = 16'h0080;
        // Test 1
        sel = 3'b000; #10;
        if (out !== a)
            $display("FAIL: sel=%b out=%h expected=%h", sel, out, a);
        else
            $display("PASS: sel=%b out=%h", sel, out);
        // Test 2
        sel = 3'b001; #10;
        if (out !== b)
            $display("FAIL: sel=%b out=%h expected=%h", sel, out, b);
        else
            $display("PASS: sel=%b out=%h", sel, out);
        // Test 3
        sel = 3'b010; #10;
        if (out !== c)
            $display("FAIL: sel=%b out=%h expected=%h", sel, out, c);
        else
            $display("PASS: sel=%b out=%h", sel, out);
        // Test 4
        sel = 3'b011; #10;
        if (out !== d)
            $display("FAIL: sel=%b out=%h expected=%h", sel, out, d);
        else
            $display("PASS: sel=%b out=%h", sel, out);
        // Test 5
        sel = 3'b100; #10;
        if (out !== e)
            $display("FAIL: sel=%b out=%h expected=%h", sel, out, e);
        else
            $display("PASS: sel=%b out=%h", sel, out);
        // Test 6
        sel = 3'b101; #10;
        if (out !== f)
            $display("FAIL: sel=%b out=%h expected=%h", sel, out, f);
        else
            $display("PASS: sel=%b out=%h", sel, out);
        // Test 7
        sel = 3'b110; #10;
        if (out !== g)
            $display("FAIL: sel=%b out=%h expected=%h", sel, out, g);
        else
            $display("PASS: sel=%b out=%h", sel, out);
        // Test 8
        sel = 3'b111; #10;
        if (out !== h)
            $display("FAIL: sel=%b out=%h expected=%h", sel, out, h);
        else
            $display("PASS: sel=%b out=%h", sel, out);
        $finish;
    end
endmodule
