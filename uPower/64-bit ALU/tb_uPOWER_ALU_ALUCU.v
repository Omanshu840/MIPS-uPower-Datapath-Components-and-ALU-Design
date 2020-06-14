/*

This file contains the tb_uPOWER_ALU_ALUCU module, which is the testbench for the combination of the uPOWER ALU Control Unit and the 64-bit ALU.
The ALU_64b.v file and the uPOWER_ALUControlUnit.v file have to be necessarily included in the directory of this file for this file to work.

The members of the team who have built this file:
--------------------------------
Name					Roll no.
--------------------------------
Bhaskar Kataria 		181CO213
Ketan Kiran Bhujange 	181CO227
Manas Trivedi 			181CO231
Omanshu Mahawar 		181CO237
--------------------------------

This file was written over a period of 11 days from 21-05-2020 to 31-05-2020.

*/

`include "ALU_64b.v"
`include "uPOWER_ALUControlUnit.v"

module tb_uPOWER_ALU_ALUCU;

    reg [1:0] ALUOp;
    reg [5:0] OpCode;
    reg [8:0] XO;
    wire [3:0] ALUControl;

    reg [63:0] a, b;
    wire [63:0] Result;
    wire Zero, Overflow;

    uPOWER_ALUControlUnit C(ALUControl, ALUOp, OpCode, XO);
    ALU_64b A(a, b, ALUControl, Result, Overflow, Zero);

    initial begin

        $dumpfile("VCD_uPOWER_ALU_ALUCU.v");
        $dumpvars(0, tb_uPOWER_ALU_ALUCU);
        $monitor($time, " a=%h, b=%h, Result=%h, Overflow = %b, Zero=%b", a, b, Result, Overflow, Zero);

        #5 a = 64'h0000000000000101; b = 64'h0000000000000011; ALUOp = 2'b10; OpCode = 6'b011111; XO = 9'b000011100;
        // a AND b. Output 0000000000000001

        #5 a = 64'h0000000000000f0f; b = 64'h00000000000000ff; ALUOp = 2'b10; OpCode = 6'b011111; XO = 9'b111011100;
        // a NAND b. Output fffffffffffffff0

        #5 a = 64'h1010000000000000; b = 64'h1100000000000000; ALUOp = 2'b10; OpCode = 6'b011111; XO = 9'b110111100;
        // a OR b. Output 1110000000000000

        #5 a = 64'h000000000000000A; b = 64'h0000000000000001; ALUOp = 2'b10; OpCode = 6'b011111; XO = 9'b100001010;
        // a + b. Output 000000000000000b

        #5 a = 64'h0000000000000007; b = 64'h0000000000000001; ALUOp = 2'b10; OpCode = 6'b011111; XO = 9'b000101000;
        // a - b. Output 0000000000000006

        #5 $finish;

    end

endmodule