/* 16-bit register */
module register(
    input wire [15:0] in,
    input wire load,
    input wire clk,
    output wire [15:0] out
);
    reg [15:0] out_reg;
    always @(posedge clk) begin
        if (load) begin
            out_reg <= in;
        end else begin
            out_reg <= out;
        end
    end
    assign out = out_reg;
endmodule