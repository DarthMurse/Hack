/* and gate for 16-bit input */
module and16(
    input wire [15:0] a,
    input wire [15:0] b,
    output wire [15:0] out
);
    assign out = a & b;
endmodule