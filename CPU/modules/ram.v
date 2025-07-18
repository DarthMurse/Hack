/* RAM of different sizes and fixed width (16-bit) */

module ram #(parameter SIZE = 8, ADDR_W = 3)
(
    input wire [15: 0] in,
    input wire [ADDR_W-1: 0] addr,
    input wire load,
    input wire clk,
    output wire [15: 0] out
);
    reg [15: 0] memory [SIZE-1: 0]; // SIZE locations of 16 bits each
    always @(posedge clk) begin
        if (load)
            memory[addr] <= in; 
    end
    assign out = memory[addr];

endmodule

module ram8(
    input wire [15: 0] in,
    input wire [2: 0] addr,
    input wire load,
    input wire clk,
    output wire [15: 0] out 
);
    ram #(8, 3) ram_8 (
        .in(in),
        .addr(addr),
        .load(load),
        .clk(clk),
        .out(out)
    );
endmodule

module ram64(
    input wire [15: 0] in,
    input wire [5: 0] addr,
    input wire load,
    input wire clk,
    output wire [15: 0] out
);
    ram #(64, 6) ram_64 (
        .in(in),
        .addr(addr),
        .load(load),
        .clk(clk),
        .out(out)
    );
endmodule

module ram512(
    input wire [15: 0] in,
    input wire [8: 0] addr,
    input wire load,
    input wire clk,
    output wire [15: 0] out
);
    ram #(512, 9) ram_512 (
        .in(in),
        .addr(addr),
        .load(load),
        .clk(clk),
        .out(out)
    );
endmodule

module ram4k(
    input wire [15: 0] in,
    input wire [11: 0] addr,
    input wire load,
    input wire clk,
    output wire [15: 0] out
);
    ram #(4096, 12) ram_4096 (
        .in(in),
        .addr(addr),
        .load(load),
        .clk(clk),
        .out(out)
    );
endmodule

module ram16k(
    input wire [15: 0] in,
    input wire [13: 0] addr,
    input wire load,
    input wire clk,
    output wire [15: 0] out
);
ram #(16384, 14) ram_16384 (
        .in(in),
        .addr(addr),
        .load(load),
        .clk(clk),
        .out(out)
    );
endmodule