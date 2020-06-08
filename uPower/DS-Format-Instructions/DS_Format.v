`include "uPOWER_ALUControlUnit.v"
`include "ALU_64b.v"


module DS_Format(PO, rt, ra, DS, XO, clk, datart, datara);

    input [5:0] PO;
    input [4:0] rt;
    input [4:0] ra;
    input [14:0] DS;
    input [32:0] XO;
    input clk;

    reg [63:0] regFile[0:63];

    reg [63:0] Mem[0:63];
    
    output wire [63:0] datart;
    output wire [63:0] datara;

    wire [63:0] Result;

    wire [63:0]Immediate;

    assign Immediate[14:0] = DS[14:0];
    assign Immediate[63:15] = {49{DS[14]}};

    wire carryout, zero, Overflow;

    integer i;
    
    initial
    begin
        for (i=0; i<31; i=i+1)
        begin
            regFile[i] = i;
        end
    end

    initial
    begin
        for (i=0; i<31; i=i+1)
        begin
            Mem[i] = i;
        end
    end

    assign datart = regFile[rt];
    assign datara = regFile[ra];

    wire [3:0] ALUControl;

    
    uPOWER_ALUControlUnit Q0(ALUControl, 2'b00, PO, 9'bx);

    ALU_64b Q1(datara, Immediate, ALUControl, Result, Overflow, zero);

    always@(posedge clk)
    begin
        case (PO)
            6'b111010: regFile[rt] <= Mem[Result];
            6'b111110: Mem[Result] <= regFile[rt];
        endcase
    end

endmodule