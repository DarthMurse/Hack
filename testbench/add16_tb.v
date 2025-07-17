`timescale 1ns/1ps
module add16_tb;
    reg [15:0] a, b;
    wire [15:0] sum;
    wire carry;

    reg [15:0] test_a[0:4];
    reg [15:0] test_b[0:4];
    reg [15:0] expected_sum;        
    integer i;

    add16 uut (
        .a(a),
        .b(b),
        .sum(sum)
    );

    initial begin
        test_a[0] = 16'h0000; test_b[0] = 16'h0000;
        test_a[1] = 16'hFFFF; test_b[1] = 16'h0001;
        test_a[2] = 16'hAAAA; test_b[2] = 16'h5555;
        test_a[3] = 16'h1234; test_b[3] = 16'h4321;
        test_a[4] = 16'hFFFF; test_b[4] = 16'hFFFF;
        $display("Testing add16 with expected results:");
        $display("a         b         | sum       | exp_sum   | Result");
        for (i = 0; i < 5; i = i + 1) begin
            a = test_a[i]; b = test_b[i];
            #10
            expected_sum = a + b;
            $display("%h %h | %h   | %h     | %s",
                a, b, sum, expected_sum,
                (sum === expected_sum) ? "PASS" : "FAIL");
        end
        $finish;
     end
endmodule
