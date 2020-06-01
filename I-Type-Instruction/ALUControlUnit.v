
module ALUControlUnit(ALUControl, AluOp, Funct);
    
    output [3:0] ALUControl;
    input [1:0] AluOp;
    input [5:0] Funct;
    wire [7:0] ALUControlIn;
    reg [3:0] Aluctrl;

    assign ALUControlIn = {AluOp,Funct};
    
    always @(ALUControlIn)
        casex (ALUControlIn)
            8'b00xxxxxx: Aluctrl<=4'b0010;  // ALU Operation: Add ; Instruction: LW-SW
            8'b01xxxxxx: Aluctrl<=4'b0110;  // ALU Operation: Sub ; Instruction: BNE
            8'b10100000: Aluctrl<=4'b0010;  // ALU Operation: Add ; Instruction: Add
            8'b10100010: Aluctrl<=4'b0110;  // ALU Operation: Sub ; Instruction: Sub
            8'b10100100: Aluctrl<=4'b0000;  // ALU Operation: AND ; Instruction: AND
            8'b10100101: Aluctrl<=4'b0001;  // ALU Operation: OR ; Instruction: OR
            8'b10101010: Aluctrl<=4'b0111;  // ALU Operaton: SLT ; Instruction: SLT
            default: Aluctrl<=4'b0000;
        endcase
    


    or o1 (ALUControl[0], Aluctrl[0], 0);
    or o2 (ALUControl[1], Aluctrl[1], 0);
    or o3 (ALUControl[2], Aluctrl[2], 0);
    or o4 (ALUControl[3], Aluctrl[3], 0);


endmodule