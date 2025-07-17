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
    wire abcd, efgh;
    dmux layer1 (
        .in(in),
        .sel(sel[2]),
        .a(abcd),
        .b(efgh)
    );
    dmux4way layer2_abcd (
        .in(abcd),
        .sel(sel[1:0]),
        .a(a),
        .b(b),
        .c(c),
        .d(d)
    );
    dmux4way layer2_efgh (
        .in(efgh),
        .sel(sel[1:0]),
        .a(e),
        .b(f),
        .c(g),
        .d(h)
    );
endmodule