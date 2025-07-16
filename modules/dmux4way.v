/* Channels the input to one out of 4 outputs */
module dmux4way(
    input wire in,
    input wire [1:0] sel,
    output wire a,
    output wire b,
    output wire c,
    output wire d
);
    assign a = in & ~sel[1] & ~sel[0];
    assign b = in & ~sel[1] & sel[0];
    assign c = in & sel[1] & ~sel[0];
    assign d = in & sel[1] & sel[0];
endmodule