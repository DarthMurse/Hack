/* select between 4 16-bit inputs */
module mux4way16(
    input wire [15:0] a,
    input wire [15:0] b,
    input wire [15:0] c,
    input wire [15:0] d,
    input wire [1:0] sel,
    output wire [15:0] out
);
    wire [15: 0] choose_a, choose_b, choose_c, choose_d;
    assign choose_a = a & {16{~sel[1] & ~sel[0]}};
    assign choose_b = b & {16{~sel[1] & sel[0]}};
    assign choose_c = c & {16{sel[1] & ~sel[0]}};
    assign choose_d = d & {16{sel[1] & sel[0]}};
    assign out = choose_a | choose_b | choose_c | choose_d;
endmodule