/* 16-bit integer addition */
module add16(
    input wire [15: 0] a, // First operand
    input wire [15: 0] b, // Second operand
    output wire [15: 0] sum // Result of addition
);
    /* Naive but inefficient implementation using full adders */
    /*
    wire [15:0] carry; // Carry bits for each bit addition
    wire [15:0] temp_sum; // Temporary sum to hold intermediate results

    // Instantiate 16 full adders for each bit of the inputs
    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1) begin : adder_loop
            if (i == 0) begin
                halfadder fa (
                    .a(a[i]),
                    .b(b[i]),
                    .sum(temp_sum[i]),
                    .carry(carry[i])
                );
            end else begin
                fulladder fa (
                    .a(a[i]),
                    .b(b[i]),
                    .c(carry[i-1]), // Carry from previous bit
                    .sum(temp_sum[i]),
                    .carry(carry[i])
                );
            end
        end
    endgenerate

    assign sum = temp_sum; // Assign the final sum output
    */
    // Optimized implementation using a single adder: Carry lookahead
    wire [15: 0] carry; // Carry bits for each bit addition
    wire [15: 0] g, p;
    assign g = a & b; // Generate bits
    assign p = a ^ b; // Propagate bits
    assign carry[0] = 1'b0; // Initial carry is zero
    genvar i;
    generate
        for (i = 0; i < 15; i = i + 1) begin : carry_loop
            assign carry[i + 1] = g[i] | (p[i] & carry[i]);
        end
    endgenerate
    assign sum = p ^ carry; // Final sum is the XOR of propagate bits and carry bits
endmodule