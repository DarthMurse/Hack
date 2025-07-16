/* 8-way or gate */
module or8way(
    input wire [7:0] in,
    output wire out
);
    wire [3: 0] layer1;
    wire [1: 0] layer2;

    assign layer1[0] = in[0] | in[1];
    assign layer1[1] = in[2] | in[3];
    assign layer1[2] = in[4] | in[5];
    assign layer1[3] = in[6] | in[7];
    assign layer2[0] = layer1[0] | layer1[1];
    assign layer2[1] = layer1[2] | layer1[3];
    assign out = layer2[0] | layer2[1];
endmodule