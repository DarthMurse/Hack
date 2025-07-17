/* 16-bit incrementer */
module inc16(
    input wire [15: 0] in, // Input operand
    output wire [15: 0] out // Result of addition
);
    // Use the add16 module to perform addition with 1
    wire [15: 0] c;
    assign c[0] = 1'b1;
    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1) begin: inc_loop
            assign out[i] = in[i] ^ c[i];
            assign c[i + 1] = in[i] & c[i];
        end
    endgenerate
endmodule