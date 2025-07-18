/* Adds up 2 bits */
module halfadder(
    input wire a,
    input wire b,
    output wire sum,
    output wire carry
);
    assign sum = a ^ b;  // Sum is the XOR of inputs
    assign carry = a & b; // Carry is the AND of inputs
endmodule