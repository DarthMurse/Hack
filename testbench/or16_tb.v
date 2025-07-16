`timescale 1ns/1ps
module or16_tb;
    reg [15:0] a, b;
    wire [15:0] out;

    or16 uut (
        .a(a),
        .b(b),
        .out(out)
    );

    initial begin
        $display("Testing or16");
        // Test 1
        a = 16'h0000; b = 16'h0000; #10;
        if (out !== (a | b))
            $display("FAIL: a=%h b=%h out=%h expected=%h", a, b, out, a | b);
        else
            $display("PASS: a=%h b=%h out=%h", a, b, out);
        // Test 2
        a = 16'hFFFF; b = 16'h0000; #10;
        if (out !== (a | b))
            $display("FAIL: a=%h b=%h out=%h expected=%h", a, b, out, a | b);
        else
            $display("PASS: a=%h b=%h out=%h", a, b, out);
        // Test 3
        a = 16'hAAAA; b = 16'h5555; #10;
        if (out !== (a | b))
            $display("FAIL: a=%h b=%h out=%h expected=%h", a, b, out, a | b);
        else
            $display("PASS: a=%h b=%h out=%h", a, b, out);
        $finish;
    end
endmodule
