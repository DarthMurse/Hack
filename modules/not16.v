/* not gate for 16-bit input */
module not16(
    input wire [15:0] in,
    output wire [15:0] out
);
    assign out = ~in;
endmodule