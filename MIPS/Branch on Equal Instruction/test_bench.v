`include "BEQ.v"

module BEQ_tb;
    reg [5:0] OpCode;
    reg [4:0] rs;
    reg [4:0] rt;
    reg [15:0] imm;

    reg clk;

    wire [31:0] datars;
    wire [31:0] datart;

    reg [31:0] pc;
    wire [31:0] npc;

    BEQ m(OpCode, rs, rt, imm, clk, datars, datart, pc, npc);

    initial
        begin
            clk = 1'b0;
            repeat(100)
            #2 clk = ~clk;
        end

    initial
        begin
            $dumpfile("BEQ.vcd");
            $dumpvars(0, BEQ_tb);

            OpCode = 6'b000101; rs = 5'b011; rt = 5'b011; imm = 16'b01100100; pc = 32'b110010;
            #4 $display("\n\tInstruction = BEQ R3, R3, 100\n\trs = %d \t rt = %d\n\tdatars = %d \t datart = %d\n\tpc = %d\n\tnpc = %d\n \n",rs, rt, datars,datart, pc, npc);

            OpCode = 6'b000101; rs = 5'b100; rt = 5'b101; imm = 16'b011001000; pc= 32'b110010;
            #4 $display("\n\tInstruction = BEQ R4, R5, 200\n\trs = %d \t rt = %d\n\tdatars = %d \t datart = %d\n\tpc = %d\n\tnpc = %d \n",rs, rt, datars,datart, pc, npc);
           
        end

endmodule 