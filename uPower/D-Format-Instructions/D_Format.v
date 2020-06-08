`include "uPOWER_ALUControlUnit.v"
`include "ALU_64b.v"


module D_Format(PO, rt, ra, SI, clk, datart, datara);

    input [5:0] PO;
    input [4:0] rt;
    input [4:0] ra;
    input [47:0] SI;
    input clk;

    reg [63:0] regFile[0:63];

    wire [63:0] Immediate;
    
    output wire [63:0] datart;
    output wire [63:0] datara;

    assign Immediate[47:0] = SI[47:0];
    assign Immediate[63:48] = {16{SI[47]}};

    wire carryout, zero, Overflow;

    integer i;
    
    initial
    begin
        for (i=0; i<63; i=i+1)
        begin
            regFile[i] = i;
        end
    end

    assign datara = regFile[ra];

    wire [3:0] ALUControl;

    uPOWER_ALUControlUnit Q0(ALUControl, 2'b10, PO, 9'bx);

    ALU_64b Q1 (datara, Immediate, ALUControl, datart, Overflow, zero);

    always@(posedge clk)
    begin
        regFile[rt] <= datart;
    end

endmodule