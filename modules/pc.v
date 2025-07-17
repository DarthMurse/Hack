/* Program Counter */
module pc(
    input wire [15: 0] in,
    input wire load,
    input wire inc,
    input wire reset,
    input wire clk,
    input wire [15: 0] out
);
    reg [15: 0] pc_reg;
    reg [15: 0] next_state;
    always @(posedge clk) begin
        if (reset)
            pc_reg <= 16'b0;
        else 
            pc_reg <= next_state;
    end

    always @(*) begin
        if (load)
            next_state = in;
        else if (inc)
            next_state = pc_reg + 1;
        else
            next_state = pc_reg;
    end

    assign out = pc_reg;
endmodule