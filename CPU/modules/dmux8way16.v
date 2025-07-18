/* Channels the input to one out of 8 outputs */
module dmux8way16(
    input wire [15:0] in,
    input wire [2:0] sel,
    output wire [15:0] a,
    output wire [15:0] b,
    output wire [15:0] c,
    output wire [15:0] d,
    output wire [15:0] e,
    output wire [15:0] f,
    output wire [15:0] g,
    output wire [15:0] h
);
    wire [15:0] abcd, efgh;
    dmux16 layer1 (
        .in(in),
        .sel(sel[2]),
        .a(abcd),
        .b(efgh)
    );
    dmux4way16 layer2_abcd (
        .in(abcd),
        .sel(sel[1:0]),
        .a(a),
        .b(b),
        .c(c),
        .d(d)
    );
    dmux4way16 layer2_efgh (
        .in(efgh),
        .sel(sel[1:0]),
        .a(e),
        .b(f),
        .c(g),
        .d(h)
    );
endmodule