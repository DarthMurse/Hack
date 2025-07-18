`timescale 1ns/1ps
module ram_tb;
    reg [15:0] in;
    reg [3:0] addr;
    reg load, clk;
    wire [15:0] out;

    ram #(16, 4) ram16 (
        .in(in), .addr(addr), .load(load), .clk(clk), .out(out)
    );

    reg [15:0] mem [0:15];
    reg [15:0] expected_out;
    integer i;

    always #5 clk = ~clk; // Clock generator

    initial begin
        // Write to all locations
        clk = 0;
        $display("Testing ram module:");
        $display("addr in      load clk | out     | exp_out | Result");
        for (i = 0; i < 16; i = i + 1) begin
            addr = i; in = i * 2; load = 1;
            mem[i] = in;
            #10;
            $display("%2d   %h   %b    %b  | %h   |  %h    | %s", addr, in, load, clk, out, mem[i], (out === mem[i]) ? "PASS" : "FAIL");
        end
        // Read from all locations
        for (i = 0; i < 16; i = i + 1) begin
            addr = i; load = 0; in = 16'h0000; // Dummy input
            #10;
            expected_out = mem[i];
            $display("%2d   --   %b    %b  | %h   |  %h    | %s", addr, load, clk, out, expected_out, (out === expected_out) ? "PASS" : "FAIL");
        end
        $finish;
    end
endmodule
