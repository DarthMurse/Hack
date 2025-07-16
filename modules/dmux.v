/* basic dmux that put the input to one of the output channels */
module dmux(
    input wire in,
    input wire sel,
    output wire a,
    output wire b
);
    assign a = in & ~sel;
    assign b = in & sel;
endmodule