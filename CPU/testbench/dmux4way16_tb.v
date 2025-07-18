`timescale 1ns/1ps
module dmux4way16_tb;
    reg [15:0] in;
    reg [1:0] sel;
    wire [15:0] a, b, c, d;

    dmux4way16 uut (
        .in(in),
        .sel(sel),
        .a(a),
        .b(b),
        .c(c),
        .d(d)
    );

    initial begin
        $display("Testing dmux4way");
        // Test 1
        in = 1; sel = 2'b00; #10;
        if (a !== 16'b0000000000000001 && (b !== 16'b0 || c !== 16'b0 || d !== 16'b0))
            $display("FAIL: sel=%b a=%b b=%b c=%b d=%b expected a=1 b=0 c=0 d=0", sel, a, b, c, d);
        else
            $display("PASS: sel=%b a=%b b=%b c=%b d=%b", sel, a, b, c, d);
        // Test 2
        sel = 2'b01; #10;
        if (b !== 16'b0000000000000001 && (a !== 16'b0 || c !== 16'b0 || d !== 16'b0))
            $display("FAIL: sel=%b a=%b b=%b c=%b d=%b expected a=0 b=1 c=0 d=0", sel, a, b, c, d);
        else
            $display("PASS: sel=%b a=%b b=%b c=%b d=%b", sel, a, b, c, d);
        // Test 3
        sel = 2'b10; #10;
        if (c !== 16'b0000000000000001 && (a !== 16'b0 || b !== 16'b0 || d !== 16'b0))
            $display("FAIL: sel=%b a=%b b=%b c=%b d=%b expected a=0 b=0 c=1 d=0", sel, a, b, c, d);
        else
            $display("PASS: sel=%b a=%b b=%b c=%b d=%b", sel, a, b, c, d);
        // Test 4
        sel = 2'b11; #10;
        if (d !== 16'b0000000000000001 && (a !== 16'b0 || b !== 16'b0 || c !== 16'b0))
            $display("FAIL: sel=%b a=%b b=%b c=%b d=%b expected a=0 b=0 c=0 d=1", sel, a, b, c, d);
        else
            $display("PASS: sel=%b a=%b b=%b c=%b d=%b", sel, a, b, c, d);
        // Test 5
        in = 0; sel = 2'b10; #10;
        if (a !== 16'b0 || b !== 16'b0 || c !== 16'b0 || d !== 16'b0)
            $display("FAIL: sel=%b a=%b b=%b c=%b d=%b expected all 0", sel, a, b, c, d);
        else
            $display("PASS: sel=%b a=%b b=%b c=%b d=%b", sel, a, b, c, d);
        $finish;
    end
endmodule
