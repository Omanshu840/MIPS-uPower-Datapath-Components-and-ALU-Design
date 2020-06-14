`include "InstructionMem.v"
`include "adder.v"

module IFH(PC, instruction, clk);

    input [31:0] PC;
    input clk;
    output [31:0] instruction;

    InstructionMem I1(instruction, PC);

    always @(posedge clk)
    begin
        Add A(PC, PC, 32'b0100);
    end

endmodule


