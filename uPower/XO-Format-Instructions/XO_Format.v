`include "uPOWER_ALUControlUnit.v"
`include "ALU_64b.v"


module XO_Format(PO, rt, ra, rb, OE, XO, Rc, clk, datart, datara, datarb);

    input [5:0] PO;
    input [4:0] rt;
    input [4:0] ra;
    input [4:0] rb;
    input [0:0] OE;
    input [8:0] XO;
    input [33:0] Rc;
    input clk;

    reg [63:0] regFile[0:63];
    
    output wire [63:0] datart;
    output wire [63:0] datara;
    output wire [63:0] datarb;

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
    assign datarb = regFile[rb];

    wire [3:0] ALUControl;

    uPOWER_ALUControlUnit Q0(ALUControl, 2'b10, PO, XO);

    ALU_64b Q1 (datarb, datara, ALUControl, datart, Overflow, zero);

    always@(posedge clk)
    begin
        regFile[rt] <= datart;
    end

endmodule