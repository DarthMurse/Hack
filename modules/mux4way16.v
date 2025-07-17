/* select between 4 16-bit inputs */
module mux4way16(
    input wire [15:0] a,
    input wire [15:0] b,
    input wire [15:0] c,
    input wire [15:0] d,
    input wire [1:0] sel,
    output wire [15:0] out
);
    wire [15: 0] layer1_ab, layer1_cd;
    mux16 mux_ab (
        .a(a),
        .b(b),
        .sel(sel[0]),
        .out(layer1_ab)
    );
    mux16 mux_cd (
        .a(c),
        .b(d),
        .sel(sel[0]),
        .out(layer1_cd)
    );
    mux16 mux2 (
        .a(layer1_ab),
        .b(layer1_cd),
        .sel(sel[1]),
        .out(out)
    );
endmodule