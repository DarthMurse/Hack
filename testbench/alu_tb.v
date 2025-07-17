`timescale 1ns/1ps
module alu_tb;
    reg [15:0] x, y;
    reg zx, nx, zy, ny, f, no;
    wire [15:0] out;
    wire zr, ng;

    alu uut (
        .x(x), .y(y), .zx(zx), .nx(nx), .zy(zy), .ny(ny), .f(f), .no(no),
        .out(out), .zr(zr), .ng(ng)
    );

    // Test vector struct
    reg [15:0] test_x[0:7];
    reg [15:0] test_y[0:7];
    reg [5:0]  test_ctrl[0:7]; // {zx, nx, zy, ny, f, no}
    reg [15:0] expected_out;
    reg expected_zr, expected_ng;
    integer i;

    // Compute expected output for a subset of Hack ALU ops
    task compute_expected;
        input [15:0] x, y;
        input zx, nx, zy, ny, f, no;
        output [15:0] out;
        output zr, ng;
        reg [15:0] x1, y1, out1;
        begin
            x1 = zx ? 16'b0 : x;
            x1 = nx ? ~x1 : x1;
            y1 = zy ? 16'b0 : y;
            y1 = ny ? ~y1 : y1;
            out1 = f ? (x1 + y1) : (x1 & y1);
            out1 = no ? ~out1 : out1;
            out = out1;
            zr = (out1 == 16'b0);
            ng = out1[15];
        end
    endtask

    initial begin
        // Test cases: x, y, zx, nx, zy, ny, f, no
        test_x[0] = 16'h0000; test_y[0] = 16'h0000; test_ctrl[0] = 6'b101010; // 0
        test_x[1] = 16'h0000; test_y[1] = 16'h0000; test_ctrl[1] = 6'b111111; // 1
        test_x[2] = 16'h0000; test_y[2] = 16'h0000; test_ctrl[2] = 6'b111010; // -1
        test_x[3] = 16'h1234; test_y[3] = 16'h0000; test_ctrl[3] = 6'b001100; // x
        test_x[4] = 16'h0000; test_y[4] = 16'h4321; test_ctrl[4] = 6'b110001; // y
        test_x[5] = 16'h1234; test_y[5] = 16'h4321; test_ctrl[5] = 6'b000010; // x+y
        test_x[6] = 16'h1234; test_y[6] = 16'h4321; test_ctrl[6] = 6'b000000; // x&y
        test_x[7] = 16'hFFFF; test_y[7] = 16'h0001; test_ctrl[7] = 6'b000010; // x+y (overflow)

        $display("Testing ALU with expected results:");
        $display("# zx nx zy ny f no | x      y      | out     zr ng | exp_out exp_zr exp_ng | Result");
        for (i = 0; i < 8; i = i + 1) begin
            {zx, nx, zy, ny, f, no} = test_ctrl[i];
            x = test_x[i];
            y = test_y[i];
            #10;
            compute_expected(x, y, zx, nx, zy, ny, f, no, expected_out, expected_zr, expected_ng);
            $display("%b  %b  %b  %b  %b %b | %h %h | %h %b  %b  | %h   %b      %b     | %s",
                zx, nx, zy, ny, f, no, x, y, out, zr, ng, expected_out, expected_zr, expected_ng,
                (out === expected_out && zr === expected_zr && ng === expected_ng) ? "PASS" : "FAIL");
        end
        $finish;
    end
endmodule
