/* or gate for 16-bit input */
module or16(
    input wire [15:0] a,
    input wire [15:0] b,
    output wire [15:0] out
);
    assign out = a | b;
endmodule