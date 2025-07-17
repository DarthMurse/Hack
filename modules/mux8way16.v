/* select between 8 16-bit inputs */
module mux8way16(
    input wire [15:0] a,
    input wire [15:0] b,
    input wire [15:0] c,
    input wire [15:0] d,
    input wire [15:0] e,
    input wire [15:0] f,
    input wire [15:0] g,
    input wire [15:0] h,
    input wire [2:0] sel,
    output wire [15:0] out
);
    wire [15:0] layer2_abcd, layer2_efgh;

    mux4way16 mux_abcd (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .sel(sel[1:0]),
        .out(layer2_abcd)
    );
    mux4way16 mux_efgh (
        .a(e),
        .b(f),
        .c(g),
        .d(h),
        .sel(sel[1:0]),
        .out(layer2_efgh)
    );
    mux16 mux_final (
        .a(layer2_abcd),
        .b(layer2_efgh),
        .sel(sel[2]),
        .out(out)
    );
endmodule