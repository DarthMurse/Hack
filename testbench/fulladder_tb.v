`timescale 1ns/1ps
module fulladder_tb;
    reg a, b, cin;
    reg [2:0] vec;        
    reg expected_sum, expected_cout;
    wire sum, cout;
    integer i;

    fulladder uut (
        .a(a),
        .b(b),
        .c(cin),
        .sum(sum),
        .carry(cout)
    );

    initial begin
        $display("Testing fulladder with expected results:");
        $display("a b cin | sum cout | exp_sum exp_cout | Result");
        for (i = 0; i < 8; i = i + 1) begin
            vec = i[2:0];
            a = vec[2]; b = vec[1]; cin = vec[0];
            #10;
            expected_sum = a ^ b ^ cin;
            expected_cout = (a & b) | (a & cin) | (b & cin);
            $display("%b %b  %b  |  %b    %b   |    %b        %b     | %s",
                a, b, cin, sum, cout, expected_sum, expected_cout,
                (sum === expected_sum && cout === expected_cout) ? "PASS" : "FAIL");
        end
        $finish;
    end
endmodule
