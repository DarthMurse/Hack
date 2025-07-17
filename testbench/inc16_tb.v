`timescale 1ns/1ps

module inc16_tb;
    reg [15:0] in;
    wire [15:0] out;

    reg [15:0] test_in[0:4];
    reg [15:0] expected_out;
    integer i;

    inc16 uut (
        .in(in),
        .out(out)
    );

    initial begin
        test_in[0] = 16'h0000;
        test_in[1] = 16'h0001;
        test_in[2] = 16'hFFFF;
        test_in[3] = 16'h7FFF;
        test_in[4] = 16'h1234;
        $display("Testing inc16 with expected results:");
        $display("in        | out      | exp_out   | Result");
        for (i = 0; i < 5; i = i + 1) begin
            in = test_in[i];
            #10;
            expected_out = in + 1;
            $display("%h | %h | %h   | %s",
                in, out, expected_out,
                (out === expected_out) ? "PASS" : "FAIL");
        end
        $finish;
     end
endmodule
