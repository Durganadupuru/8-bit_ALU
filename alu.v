##8-bit ALU implementation in Basys3 Board

module alu (
    input  [7:0] A,
    input  [7:0] B,
    input  [3:0] sel,
    output reg [7:0] result,
    output reg carry,
    output reg zero
);

always @(*) begin
    carry = 0;
    result = 8'b0;

    case (sel)
        4'b0000: {carry, result} = A + B;               // ADD
        4'b0001: {carry, result} = A - B;               // SUB
        4'b0010: result = A & B;                        // AND
        4'b0011: result = A | B;                        // OR
        4'b0100: result = A ^ B;                        // XOR
        4'b0101: result = ~A;                           // NOT A
        4'b0110: result = A << 1;                       // Shift Left
        4'b0111: result = A >> 1;                       // Shift Right
        4'b1000: result = A * B;                        // Multiplication
        4'b1001: result = (B != 0) ? A / B : 8'b00000000; // Division
        4'b1010: result = (B != 0) ? A % B : 8'b00000000; // Modulo
        4'b1011: result = (A == B) ? 8'b00000001 : 8'b00000000; // A == B
        4'b1100: result = (A > B)  ? 8'b00000001 : 8'b00000000; // A > B
        4'b1101: result = (A < B)  ? 8'b00000001 : 8'b00000000; // A < B
        default: result = 8'b00000000;
    endcase

    zero = (result == 8'b00000000) ? 1'b1 : 1'b0;
end

endmodule
