/* Channels the input to one out of 8 outputs */
module dmux8way(
    input wire in,
    input wire [2:0] sel,
    output wire a,
    output wire b,
    output wire c,
    output wire d,
    output wire e,
    output wire f,
    output wire g,
    output wire h
);
    assign a = in & ~sel[2] & ~sel[1] & ~sel[0];
    assign b = in & ~sel[2] & ~sel[1] & sel[0];
    assign c = in & ~sel[2] & sel[1] & ~sel[0];
    assign d = in & ~sel[2] & sel[1] & sel[0];
    assign e = in & sel[2] & ~sel[1] & ~sel[0];
    assign f = in & sel[2] & ~sel[1] & sel[0];
    assign g = in & sel[2] & sel[1] & ~sel[0];
    assign h = in & sel[2] & sel[1] & sel[0];
endmodule