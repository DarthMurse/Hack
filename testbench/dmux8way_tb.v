`timescale 1ns/1ps
module dmux8way_tb;
    reg in;
    reg [2:0] sel;
    wire a, b, c, d, e, f, g, h;

    dmux8way uut (
        .in(in),
        .sel(sel),
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .e(e),
        .f(f),
        .g(g),
        .h(h)
    );

    initial begin
        $display("Testing dmux8way");
        in = 1;
        sel = 3'b000; #10;
        if (a !== 1'b1 && (b|c|d|e|f|g|h) !== 1'b0)
            $display("FAIL: sel=%b a=%b b=%b c=%b d=%b e=%b f=%b g=%b h=%b expected a=1 others=0", sel, a, b, c, d, e, f, g, h);
        else
            $display("PASS: sel=%b a=%b b=%b c=%b d=%b e=%b f=%b g=%b h=%b", sel, a, b, c, d, e, f, g, h);
        sel = 3'b001; #10;
        if (b !== 1'b1 && (a|c|d|e|f|g|h) !== 1'b0)
            $display("FAIL: sel=%b a=%b b=%b c=%b d=%b e=%b f=%b g=%b h=%b expected b=1 others=0", sel, a, b, c, d, e, f, g, h);
        else
            $display("PASS: sel=%b a=%b b=%b c=%b d=%b e=%b f=%b g=%b h=%b", sel, a, b, c, d, e, f, g, h);
        sel = 3'b010; #10;
        if (c !== 1'b1 && (a|b|d|e|f|g|h) !== 1'b0)
            $display("FAIL: sel=%b a=%b b=%b c=%b d=%b e=%b f=%b g=%b h=%b expected c=1 others=0", sel, a, b, c, d, e, f, g, h);
        else
            $display("PASS: sel=%b a=%b b=%b c=%b d=%b e=%b f=%b g=%b h=%b", sel, a, b, c, d, e, f, g, h);
        sel = 3'b011; #10;
        if (d !== 1'b1 && (a|b|c|e|f|g|h) !== 1'b0)
            $display("FAIL: sel=%b a=%b b=%b c=%b d=%b e=%b f=%b g=%b h=%b expected d=1 others=0", sel, a, b, c, d, e, f, g, h);
        else
            $display("PASS: sel=%b a=%b b=%b c=%b d=%b e=%b f=%b g=%b h=%b", sel, a, b, c, d, e, f, g, h);
        sel = 3'b100; #10;
        if (e !== 1'b1 && (a|b|c|d|f|g|h) !== 1'b0)
            $display("FAIL: sel=%b a=%b b=%b c=%b d=%b e=%b f=%b g=%b h=%b expected e=1 others=0", sel, a, b, c, d, e, f, g, h);
        else
            $display("PASS: sel=%b a=%b b=%b c=%b d=%b e=%b f=%b g=%b h=%b", sel, a, b, c, d, e, f, g, h);
        sel = 3'b101; #10;
        if (f !== 1'b1 && (a|b|c|d|e|g|h) !== 1'b0)
            $display("FAIL: sel=%b a=%b b=%b c=%b d=%b e=%b f=%b g=%b h=%b expected f=1 others=0", sel, a, b, c, d, e, f, g, h);
        else
            $display("PASS: sel=%b a=%b b=%b c=%b d=%b e=%b f=%b g=%b h=%b", sel, a, b, c, d, e, f, g, h);
        sel = 3'b110; #10;
        if (g !== 1'b1 && (a|b|c|d|e|f|h) !== 1'b0)
            $display("FAIL: sel=%b a=%b b=%b c=%b d=%b e=%b f=%b g=%b h=%b expected g=1 others=0", sel, a, b, c, d, e, f, g, h);
        else
            $display("PASS: sel=%b a=%b b=%b c=%b d=%b e=%b f=%b g=%b h=%b", sel, a, b, c, d, e, f, g, h);
        sel = 3'b111; #10;
        if (h !== 1'b1 && (a|b|c|d|e|f|g) !== 1'b0)
            $display("FAIL: sel=%b a=%b b=%b c=%b d=%b e=%b f=%b g=%b h=%b expected h=1 others=0", sel, a, b, c, d, e, f, g, h);
        else
            $display("PASS: sel=%b a=%b b=%b c=%b d=%b e=%b f=%b g=%b h=%b", sel, a, b, c, d, e, f, g, h);
        in = 0; sel = 3'b011; #10;
        if (a|b|c|d|e|f|g|h)
            $display("FAIL: sel=%b a=%b b=%b c=%b d=%b e=%b f=%b g=%b h=%b expected all 0", sel, a, b, c, d, e, f, g, h);
        else
            $display("PASS: sel=%b a=%b b=%b c=%b d=%b e=%b f=%b g=%b h=%b", sel, a, b, c, d, e, f, g, h);
        $finish;
    end
endmodule
