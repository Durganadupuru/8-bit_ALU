`timescale 1ns / 1ps

module alu_tb;

reg  [7:0] A, B;
reg  [3:0] sel;
wire [7:0] result;
wire carry, zero;

alu dut (
    .A(A), .B(B), .sel(sel),
    .result(result), .carry(carry), .zero(zero)
);

initial begin
    $display("Starting Extended ALU test...");
    A = 8'd10; B = 8'd3;

    for (sel = 0; sel <= 4'd11; sel = sel + 1) begin
        #10;
        $display("sel=%b, A=%d, B=%d -> result=%d, carry=%b, zero=%b",
                 sel, A, B, result, carry, zero);
    end

    $finish;
end


endmodule
