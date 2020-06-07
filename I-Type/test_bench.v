`include "I_Type.v"

module I_tb;
    reg [5:0] OpCode;
    reg [4:0] rs;
    reg [4:0] rt;
    reg [15:0] imm;

    reg clk;

    wire [31:0] datars;
    wire [31:0] datart;

    I_Type m(OpCode, rs, rt, imm, clk, datars, datart);

    initial
        begin
            clk = 1'b0;
            repeat(100)
            #2 clk = ~clk;
        end

    initial
        begin
            $dumpfile("I_type.vcd");
            $dumpvars(0, I_tb);

            OpCode = 6'b001000; rs = 5'b011; rt = 5'b111; imm = 16'b01100100;
            #4 $display("\n\tInstruction = ADDI R7, R3, 100\n\trs = %d \t rt = %d\n\tdatars = %d \t datart = %d \t\n \n",rs, rt, datars,datart);

            OpCode = 6'b001000; rs = 5'b100; rt = 5'b110; imm = 16'b011001000;
            #4 $display("\n\tInstruction = ADDI R6, R4, 200\n\trs = %d \t rt = %d\n\tdatars = %d \t datart = %d \t\n \n",rs, rt, datars,datart);
           
            OpCode = 6'b001000; rs = 5'b111; rt = 5'b1001; imm = 16'b111110100;
            #4 $display("\n\tInstruction = ADDI R9, R7, 500\n\trs = %d \t rt = %d\n\tdatars = %d \t datart = %d \t\n \n",rs, rt, datars,datart);

            OpCode = 6'b001000; rs = 5'b110; rt = 5'b1100; imm = 16'b1010111100;
            #4 $display("\n\tInstruction = ADDI R12, R6, 700\n\trs = %d \t rt = %d\n\tdatars = %d \t datart = %d \t\n \n",rs, rt, datars,datart);


        end

endmodule 