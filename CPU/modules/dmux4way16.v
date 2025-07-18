/* Channels the input to one out of 4 outputs */
module dmux4way16(
    input wire [15:0] in,
    input wire [1:0] sel,
    output wire [15:0] a,
    output wire [15:0] b,
    output wire [15:0] c,
    output wire [15:0] d
);
    wire [15:0] layer1_ab, layer1_cd;
    dmux16 layer1 (
        .in(in),
        .sel(sel[1]),
        .a(layer1_ab),
        .b(layer1_cd)
    );
    dmux16 layer2_ab (
        .in(layer1_ab),
        .sel(sel[0]),
        .a(a),
        .b(b)
    );
    dmux16 layer2_cd (
        .in(layer1_cd),
        .sel(sel[0]),
        .a(c),
        .b(d)
    );

endmodule