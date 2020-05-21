
module ALUControlUnit( ALUControl, AluOp, Funct);
    
    output [1:0] ALUControl;
    reg [1:0] ALUControl;
    input [1:0] AluOp;
    input [5:0] Funct;
    wire [7:0] ALUControlIn;

    assign ALUControlIn = {AluOp,Funct};
    
    always @(ALUControlIn)
        casex (ALUControlIn)
            8'b11xxxxxx: ALUControl=2'b01;  // ALU Operaton: XOR ; Instruction: XORI
            8'b00xxxxxx: ALUControl=2'b00;  // ALU Operaton: Add ; Instruction: LW-SW
            8'b01xxxxxx: ALUControl=2'b10;  // ALU Operaton: Sub ; Instruction: BNE
            8'b10100000: ALUControl=2'b00;  // ALU Operaton: Add ; Instruction: R-Type: ADD
            8'b10100010: ALUControl=2'b10;  // ALU Operaton: Sub ; Instruction: R-Type: SUB
            8'b10101010: ALUControl=2'b11;  // ALU Operaton: SLT ; Instruction: SLT
            default: ALUControl=2'b00;
        endcase

endmodule