`include "uPOWER_ALUControlUnit.v"

module tb_ALUCU;

    reg [1:0] ALUOp;
    reg [5:0] OpCode;
    reg [8:0] XO;

    reg clk;

    
    wire [3:0] ALUControl;


    uPOWER_ALUControlUnit m(ALUControl, ALUOp, OpCode, XO);

    initial
        begin
            clk = 1'b0;
            repeat(100)
            #2 clk = ~clk;
        end

    initial
        begin
            $dumpfile("tb_ALUCU.vcd");
            $dumpvars(0, tb_ALUCU);

            ALUOp = 2'b00; OpCode = 6'b111010 ; XO = 9'b0000;
            #4 $display("\tInstruction Load Double Word\n\tALUOp = %b \tOpCode = %d \t XO = %d \n\tALUControl = %b \t\n",ALUOp, OpCode, XO,  ALUControl);
           
            ALUOp = 2'b00; OpCode = 6'b111110 ; XO = 9'b0000;
            #4 $display("\tInstruction Store Double Word\n\tALUOp = %b \tOpCode = %d \t XO = %d \n\tALUControl = %b \t\n",ALUOp, OpCode, XO ,ALUControl);
           
            ALUOp = 2'b01; OpCode = 6'b10011 ; XO = 9'b0000;
            #4 $display("\tInstruction Branch Condition Relative\n\tALUOp = %b \tOpCode = %d \t XO = %d \n\tALUControl = %b \t\n",ALUOp, OpCode, XO ,ALUControl);
           
            ALUOp = 2'b10; OpCode = 6'b001110 ; XO = 9'b0000;
            #4 $display("\tInstruction ADDI\n\tALUOp = %b \tOpCode = %d \t XO = %d \n\tALUControl = %b \t\n",ALUOp, OpCode, XO ,ALUControl);
           
            ALUOp = 2'b10; OpCode = 6'b011000 ; XO = 9'b0000;
            #4 $display("\tInstruction ORI\n\tALUOp = %b \tOpCode = %d \t XO = %d \n\tALUControl = %b \t\n",ALUOp, OpCode, XO ,ALUControl);
           
            ALUOp = 2'b10; OpCode = 6'b011100 ; XO = 9'b0000;
            #4 $display("\tInstruction ANDI\n\tALUOp = %b \tOpCode = %d \t XO = %d \n\tALUControl = %b \t\n",ALUOp, OpCode, XO ,ALUControl);
           
            ALUOp = 2'b10; OpCode = 6'b011111 ; XO = 9'b000011100;
            #4 $display("\tInstruction AND\n\tALUOp = %b \tOpCode = %d \t XO = %d \n\tALUControl = %b \t\n",ALUOp, OpCode, XO ,ALUControl);
           
            ALUOp = 2'b10; OpCode = 6'b011111 ; XO = 9'b000101000;
            #4 $display("\tInstruction SUB\n\tALUOp = %b \tOpCode = %d \t XO = %d \n\tALUControl = %b \t\n",ALUOp, OpCode, XO ,ALUControl);
           
            ALUOp = 2'b10; OpCode = 6'b011111 ; XO = 9'b100001010;
            #4 $display("\tInstruction ADD\n\tALUOp = %b \tOpCode = %d \t XO = %d \n\tALUControl = %b \t\n",ALUOp, OpCode, XO ,ALUControl);
           
            ALUOp = 2'b10; OpCode = 6'b011111 ; XO = 9'b110111100;
            #4 $display("\tInstruction OR\n\tALUOp = %b \tOpCode = %d \t XO = %d \n\tALUControl = %b \t\n",ALUOp, OpCode, XO ,ALUControl);
           
            ALUOp = 2'b10; OpCode = 6'b011111 ; XO = 9'b111011100;
            #4 $display("\tInstruction NAND\n\tALUOp = %b \tOpCode = %d \t XO = %d \n\tALUControl = %b \t\n",ALUOp, OpCode, XO ,ALUControl);
           

        end

endmodule 