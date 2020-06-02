`include "MIPS_ALUControlUnit.v"
`include "ALU_32b.v"


module I_Type(OpCode, rs, rt, imm, clk, datars, datart);

    input [5:0] OpCode;
    input [4:0] rs;
    input [4:0] rt;
    input [15:0] imm;
    input clk;

    reg [31:0] regFile[0:31];

    reg [31:0] Mem[0:31];
    
    output wire [31:0] datars;
    output wire [31:0] datart;

    wire [31:0] Result;

    wire [31:0]Immediate;

    assign Immediate[15:0] = imm[15:0];
    assign Immediate[31:16] = {16{imm[15]}};

    wire carryout, zero, Overflow;

    integer i;
    
    initial
    begin
        for (i=0; i<31; i++)
        begin
            regFile[i] = i;
        end
    end

    initial
    begin
        for (i=0; i<31; i++)
        begin
            Mem[i] = i;
        end
    end

    assign datars = regFile[rs];
    assign datart = regFile[rt];

    wire [3:0] ALUControl;

    MIPS_ALUControlUnit Q0(ALUControl, 2'b00, imm[5:0]);

    ALU_32b Q1 (datars, Immediate, ALUControl, Result, Overflow, zero);

    always@(posedge clk)
    begin
        case (OpCode)
            6'b100011: regFile[rt] <= Mem[Result];
            6'b101011: Mem[Result] <= regFile[rt];
        endcase
    end

endmodule