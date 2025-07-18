/* mux for 16-bit input and a single select line */
module mux16(
    input wire [15:0] a,
    input wire [15:0] b,
    input wire sel,
    output wire [15:0] out
);
    wire [15:0] choose_a;
    wire [15:0] choose_b;

    assign choose_b = b & {16{sel}};
    assign choose_a = a & {16{~sel}};
    assign out = choose_a | choose_b;
endmodule 