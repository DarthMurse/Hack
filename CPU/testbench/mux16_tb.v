`timescale 1ns/1ps
module mux16_tb;
    reg [15:0] a, b;
    reg sel;
    wire [15:0] out;

    mux16 uut (
        .a(a),
        .b(b),
        .sel(sel),
        .out(out)
    );

    initial begin
        $display("Testing mux16");
        // Test 1
        a = 16'hAAAA; b = 16'h5555; sel = 0; #10;
        if (out !== a)
            $display("FAIL: a=%h b=%h sel=%b out=%h expected=%h", a, b, sel, out, a);
        else
            $display("PASS: a=%h b=%h sel=%b out=%h", a, b, sel, out);
        // Test 2
        sel = 1; #10;
        if (out !== b)
            $display("FAIL: a=%h b=%h sel=%b out=%h expected=%h", a, b, sel, out, b);
        else
            $display("PASS: a=%h b=%h sel=%b out=%h", a, b, sel, out);
        // Test 3
        a = 16'hFFFF; b = 16'h0000; sel = 0; #10;
        if (out !== a)
            $display("FAIL: a=%h b=%h sel=%b out=%h expected=%h", a, b, sel, out, a);
        else
            $display("PASS: a=%h b=%h sel=%b out=%h", a, b, sel, out);
        // Test 4
        sel = 1; #10;
        if (out !== b)
            $display("FAIL: a=%h b=%h sel=%b out=%h expected=%h", a, b, sel, out, b);
        else
            $display("PASS: a=%h b=%h sel=%b out=%h", a, b, sel, out);
        $finish;
    end
endmodule
