`include "IFH.v"

module IFH_tb;

    reg clk;
    wire [31:0] instruction;

    reg [31:0] inputPC;

    IFH I(instruction, clk, inputPC);

    initial
    begin
      clk = 1'b0;
      repeat(3)
      #2 clk = ~clk;
    end

    initial
    begin
        $dumpfile("IFH.vcd");
        $dumpvars(0, IFH_tb);

        inputPC = 32'b0;
        $display($time, "Instruction = %b", instruction);
        
    end

endmodule