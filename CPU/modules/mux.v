/* basic mux that choose between two inputs */
module mux(
    input wire a,
    input wire b,
    input wire sel,
    output wire out
);
    assign choose_b = b & sel;
    assign choose_a = a & ~sel;
    assign out = choose_a | choose_b;
endmodule 