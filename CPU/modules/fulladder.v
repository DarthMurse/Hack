/* Adds up 3 bits */
module fulladder(
    input wire a,
    input wire b,
    input wire c,
    output wire sum,
    output wire carry
);
    wire s1, c1, c2;
    halfadder ha1 (
        .a(a),
        .b(b),
        .sum(s1),
        .carry(c1)
    );
    halfadder ha2 (
        .a(s1),
        .b(c),
        .sum(sum),
        .carry(c2)
    );
    assign carry = c1 | c2;
endmodule