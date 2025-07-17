/* Channels the input to one out of 4 outputs */
module dmux4way(
    input wire in,
    input wire [1:0] sel,
    output wire a,
    output wire b,
    output wire c,
    output wire d
);
    wire layer1_ab, layer1_cd;
    dmux layer1 (
        .in(in),
        .sel(sel[1]),
        .a(layer1_ab),
        .b(layer1_cd)
    );
    dmux layer2_ab (
        .in(layer1_ab),
        .sel(sel[0]),
        .a(a),
        .b(b)
    );
    dmux layer2_cd (
        .in(layer1_cd),
        .sel(sel[0]),
        .a(c),
        .b(d)
    );

endmodule