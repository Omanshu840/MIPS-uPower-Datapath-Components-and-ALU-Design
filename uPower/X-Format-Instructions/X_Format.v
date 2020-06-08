`include "uPOWER_ALUControlUnit.v"
`include "ALU_64b.v"


module X_Format(PO, rs, ra, rb, XO, Rc, clk, datars, datara, datarb);

    input [5:0] PO;
    input [4:0] rs;
    input [4:0] ra;
    input [4:0] rb;
    input [8:0] XO;
    input [33:0] Rc;
    input clk;

    reg [63:0] regFile[0:63];
    
    output wire [63:0] datars;
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

    assign datars = regFile[rs];
    assign datarb = regFile[rb];

    wire [3:0] ALUControl;

    uPOWER_ALUControlUnit Q0(ALUControl, 2'b10, PO, XO);

    ALU_64b Q1 (datars, datarb, ALUControl, datara, Overflow, zero);

    always@(posedge clk)
    begin
        regFile[ra] <= datara;
    end

endmodule