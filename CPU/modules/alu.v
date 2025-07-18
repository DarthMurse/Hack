/* Hack ALU */
module alu(
    input wire [15: 0] x,
    input wire [15: 0] y,
    input wire zx, // Zero x
    input wire nx,
    input wire zy, // Zero y
    input wire ny,
    input wire f, // Function select
    input wire no, // Negate output
    output wire [15: 0] out, // ALU output
    output wire zr, // Zero result
    output wire ng // Negative result
);
    wire [15: 0] x_0, y_0, x_0n, y_0n, x_p, y_p, add_r, and_r, f_r, f_rn, temp_out;
    wire msb8, lsb8;
    mux16 mux_x0 (
        .a(x),
        .b(16'b0),
        .sel(zx),
        .out(x_0)
    );
    mux16 mux_y0 (
        .a(y),
        .b(16'b0),
        .sel(zy),
        .out(y_0)
    );
    not16 not_x (
        .in(x_0),
        .out(x_0n)
    );
    not16 not_y (
        .in(y_0),
        .out(y_0n)
    );
    mux16 mux_xn (
        .a(x_0),
        .b(x_0n),   
        .sel(nx),
        .out(x_p)
    );
    mux16 mux_yn (
        .a(y_0),
        .b(y_0n),
        .sel(ny),
        .out(y_p)
    );
    add16 add_inst (
        .a(x_p),
        .b(y_p),
        .sum(add_r)
    );
    and16 and_inst (
        .a(x_p),
        .b(y_p),
        .out(and_r)
    );
    mux16 mux_f (
        .a(and_r),
        .b(add_r),
        .sel(f),
        .out(f_r)
    );
    not16 not_f (
        .in(f_r),
        .out(f_rn)
    );
    mux16 mux_fn (
        .a(f_r),
        .b(f_rn),
        .sel(no),
        .out(temp_out)
    );
    assign out = temp_out;
    or8way or8_msb (
        .in(temp_out[15: 8]),
        .out(msb8)
    );
    or8way or8_lsb (
        .in(temp_out[7: 0]),
        .out(lsb8)
    );
    assign zr = ~(msb8 | lsb8);
    assign ng = temp_out[15];
endmodule