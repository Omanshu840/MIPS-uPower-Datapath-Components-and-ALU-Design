`include "ALUControlUnit.v"
`include "ALU.v"


module R_Type(rs, rt, rd, clk, funct, datars, datart, datard);

    input [4:0] rs;
    input [4:0] rt;
    input [4:0] rd;
    input [5:0] funct;
    input clk;

    reg [31:0] regFile[0:31];
    
    output wire [31:0] datars;
    output wire [31:0] datart;
    output wire [31:0] datard;

    wire carryout, zero, Overflow;

    integer i;
    
    initial
    begin
        for (i=0; i<31; i++)
        begin
            regFile[i] = i;
        end
    end

    assign datars = regFile[rs];
    assign datart = regFile[rt];

    wire [3:0] ALUControl;

    ALUControlUnit Q0(ALUControl, 2'b10, funct);

    MIPS_ALU_32b Q1 (datars, datart, ALUControl, datard, Overflow, zero);

    always@(posedge clk)
    begin
        regFile[rd] <= datard;
    end

endmodule