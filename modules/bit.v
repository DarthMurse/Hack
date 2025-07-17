/* 1-bit register */
module bit(
    input wire in,
    input wire load,
    input wire clk,
    output wire out
);
    reg out_reg;
    always @(posedge clk) begin
        if (load) begin
            out_reg <= in;
        end else begin 
            out_reg <= out;
        end
    end
    assign out = out_reg;
endmodule