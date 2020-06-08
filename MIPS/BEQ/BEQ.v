`include "MIPS_ALUControlUnit.v"
`include "ALU_32b.v"


module BEQ(OpCode, rs, rt, imm, clk, datars, datart, pc,npc);

    input [5:0] OpCode;
    input [4:0] rs;
    input [4:0] rt;
    input [15:0] imm;
    input [31:0] pc;
    input clk;

    reg [31:0] regFile[0:31];
    
    output wire [31:0] datars;
    output wire [31:0] datart;
    output reg [31:0] npc;

    wire [31:0] Result;

    wire [31:0]Immediate;

    assign Immediate[15:0] = imm[15:0];
    assign Immediate[31:16] = {16{imm[15]}};


    wire [31:0] Shiftedimm;
    
    assign Shiftedimm = Immediate[31:0] << 2; 

    wire carryout, zero, Overflow;

    integer i;
    
    initial
    begin
        for (i=0; i<31; i=i+1)
        begin
            regFile[i] = i;
        end
    end

    assign datars = regFile[rs];
    assign datart = regFile[rt];

    wire [3:0] ALUControl;

    MIPS_ALUControlUnit Q0(ALUControl, 2'b01, imm[5:0]);

    ALU_32b Q1 (datars, datart, ALUControl, Result, Overflow, zero);

    always@(posedge clk)
    begin
        npc = (zero == 1)? (pc+Shiftedimm+32'b100):(pc+32'b100);
    end

endmodule