`include "Instruction_Fetch_Hardware.v"

module tb_Instruction_Fetch_Hardware;

    // Inputs
    reg clk;
    reg reset;

    // Outputs
    wire [31:0] instruction;
    wire [31:0] pc_out;

    wire [31:0] virtualPC;

    // Instantiating the Design Under Test
    Instruction_Fetch_Hardware IFH(clk, reset, instruction, pc_out);

    assign virtualPC = pc_out + 32'h400000;

    // Clock
    initial
    begin
        clk = 1'b0;
        repeat(10)
        #5 clk = ~clk;
    end

    initial
    begin
        $dumpfile("VCD_Instruction_Fetch_Hardware.vcd");
        $dumpvars(0, tb_Instruction_Fetch_Hardware);
        $monitor($time, ": PC = %h, Instruction = %b", virtualPC, instruction);

        reset = 1'b1;
        // Delay here for global reset to finish
        #1;
        reset = 1'b0;
    end

endmodule