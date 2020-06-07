`include "LWSW.v"

module I_tb;
    reg [5:0] OpCode;
    reg [4:0] rs;
    reg [4:0] rt;
    reg [15:0] imm;

    reg clk;

    wire [31:0] datars;
    wire [31:0] datart;

    LWSW m(OpCode, rs, rt, imm, clk, datars, datart);

    initial
        begin
            clk = 1'b0;
            repeat(100)
            #2 clk = ~clk;
        end

    initial
        begin
            $dumpfile("LWSW.vcd");
            $dumpvars(0, I_tb);

            OpCode = 6'b100011; rs = 5'b011; rt = 5'b010; imm = 16'b101;
            #4 $display("\n\tInstruction = LW R2, 5(R3)\n\trs = %d \t rt = %d\n\tdatars = %d \t datart = %d \t\n \n",rs, rt, datars,datart);

            OpCode = 6'b101011; rs = 5'b011; rt = 5'b1001; imm = 16'b111;
            #4 $display("\n\tInstruction = SW R9, 7(R3)\n\trs = %d \t rt = %d\n\tdatars = %d \t datart = %d \t\n \n",rs, rt, datars,datart);
           
            OpCode = 6'b100011; rs = 5'b1010; rt = 5'b111; imm = 16'b000;
            #4 $display("\n\tInstruction = LW R7, 0(R10)\n\trs = %d \t rt = %d\n\tdatars = %d \t datart = %d \t\n \n",rs, rt, datars,datart);

        end

endmodule 