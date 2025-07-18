/* basic dmux that put the input to one of the output channels */
module dmux16(
    input wire [15: 0] in,
    input wire sel,
    output wire [15: 0] a,
    output wire [15: 0] b
);
    assign a = in & {16{~sel}};
    assign b = in & {16{sel}};
endmodule