`timescale 1ns/1ps
module mux_tb;
    reg a, b, sel;
    wire out;

    mux uut (
        .a(a),
        .b(b),
        .sel(sel),
        .out(out)
    );

    initial begin
        $display("Testing mux");
        // Test 1
        a = 0; b = 1; sel = 0; #10;
        if (out !== a)
            $display("FAIL: a=%b b=%b sel=%b out=%b expected=%b", a, b, sel, out, a);
        else
            $display("PASS: a=%b b=%b sel=%b out=%b", a, b, sel, out);
        // Test 2
        sel = 1; #10;
        if (out !== b)
            $display("FAIL: a=%b b=%b sel=%b out=%b expected=%b", a, b, sel, out, b);
        else
            $display("PASS: a=%b b=%b sel=%b out=%b", a, b, sel, out);
        // Test 3
        a = 1; b = 0; sel = 0; #10;
        if (out !== a)
            $display("FAIL: a=%b b=%b sel=%b out=%b expected=%b", a, b, sel, out, a);
        else
            $display("PASS: a=%b b=%b sel=%b out=%b", a, b, sel, out);
        // Test 4
        sel = 1; #10;
        if (out !== b)
            $display("FAIL: a=%b b=%b sel=%b out=%b expected=%b", a, b, sel, out, b);
        else
            $display("PASS: a=%b b=%b sel=%b out=%b", a, b, sel, out);
        $finish;
    end
endmodule
