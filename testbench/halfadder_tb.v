`timescale 1ns/1ps
module halfadder_tb;
    reg a, b;
    wire sum, carry;

    integer i;
    reg [1:0] vec;
    reg expected_sum, expected_carry;

    halfadder uut (
        .a(a),
        .b(b),
        .sum(sum),
        .carry(carry)
    );

    initial begin
        $display("Testing halfadder with expected results:");
        $display("a b | sum carry | exp_sum exp_carry | Result");
        for (i = 0; i < 4; i = i + 1) begin
            vec = i[1:0];
            a = vec[1]; b = vec[0];
            #10;
            expected_sum = a ^ b;
            expected_carry = a & b;
            $display("%b %b |  %b    %b   |    %b        %b     | %s",
                a, b, sum, carry, expected_sum, expected_carry,
                (sum === expected_sum && carry === expected_carry) ? "PASS" : "FAIL");
        end
        $finish;
    end
endmodule
