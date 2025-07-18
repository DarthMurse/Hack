`timescale 1ns/1ps
module dmux16_tb;
    reg [15: 0] in;
    reg sel;
    wire [15: 0] a, b;

    dmux16 uut (
        .in(in),
        .sel(sel),
        .a(a),
        .b(b)
    );

    initial begin
        $display("Testing dmux16");
        // Test 1
        in = 1; sel = 0; #10;
        if (a !== 16'b0000000000000001 || b !== 16'b0)
            $display("FAIL: in=%b sel=%b a=%b b=%b expected a=1 b=0", in, sel, a, b);
        else
            $display("PASS: in=%b sel=%b a=%b b=%b", in, sel, a, b);
        // Test 2
        in = 1; sel = 1; #10;
        if (a !== 16'b0 || b !== 16'b0000000000000001)
            $display("FAIL: in=%b sel=%b a=%b b=%b expected a=0 b=1", in, sel, a, b);
        else
            $display("PASS: in=%b sel=%b a=%b b=%b", in, sel, a, b);
        // Test 3
        in = 0; sel = 0; #10;
        if (a !== 16'b0 || b !== 16'b0)
            $display("FAIL: in=%b sel=%b a=%b b=%b expected a=0 b=0", in, sel, a, b);
        else
            $display("PASS: in=%b sel=%b a=%b b=%b", in, sel, a, b);
        $finish;
    end
endmodule
