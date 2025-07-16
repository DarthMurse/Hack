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
    wire [15:0] choose_a, choose_b, choose_c, choose_d, choose_e, choose_f, choose_g, choose_h;

    assign choose_a = a & {16{~sel[2] & ~sel[1] & ~sel[0]}};
    assign choose_b = b & {16{~sel[2] & ~sel[1] & sel[0]}};
    assign choose_c = c & {16{~sel[2] & sel[1] & ~sel[0]}};
    assign choose_d = d & {16{~sel[2] & sel[1] & sel[0]}};
    assign choose_e = e & {16{sel[2] & ~sel[1] & ~sel[0]}};
    assign choose_f = f & {16{sel[2] & ~sel[1] & sel[0]}};
    assign choose_g = g & {16{sel[2] & sel[1] & ~sel[0]}};
    assign choose_h = h & {16{sel[2] & sel[1] & sel[0]}};

    assign out = choose_a | choose_b | choose_c | choose_d | choose_e | choose_f | choose_g | choose_h;
endmodule