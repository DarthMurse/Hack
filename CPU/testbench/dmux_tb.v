`timescale 1ns/1ps
module dmux_tb;
    reg in, sel;
    wire a, b;

    dmux uut (
        .in(in),
        .sel(sel),
        .a(a),
        .b(b)
    );

    initial begin
        $display("Testing dmux");
        // Test 1
        in = 1; sel = 0; #10;
        if (a !== 1'b1 || b !== 1'b0)
            $display("FAIL: in=%b sel=%b a=%b b=%b expected a=1 b=0", in, sel, a, b);
        else
            $display("PASS: in=%b sel=%b a=%b b=%b", in, sel, a, b);
        // Test 2
        in = 1; sel = 1; #10;
        if (a !== 1'b0 || b !== 1'b1)
            $display("FAIL: in=%b sel=%b a=%b b=%b expected a=0 b=1", in, sel, a, b);
        else
            $display("PASS: in=%b sel=%b a=%b b=%b", in, sel, a, b);
        // Test 3
        in = 0; sel = 0; #10;
        if (a !== 1'b0 || b !== 1'b0)
            $display("FAIL: in=%b sel=%b a=%b b=%b expected a=0 b=0", in, sel, a, b);
        else
            $display("PASS: in=%b sel=%b a=%b b=%b", in, sel, a, b);
        $finish;
    end
endmodule
