module Instruction_Memory(instruction, address);

    input [31:0] address; // From PC
    output reg [31:0] instruction;
    reg [31:0]instructionMemory[1023:0];

    // Filling instrmem with the instructions from instr.txt
    initial
    begin
        $readmemb("instr.txt", instructionMemory);
    end

    // Whenever the input address changes, output the required instruction
    always @(address)
    begin
        instruction = instructionMemory[address/4];
    end

endmodule

module Instruction_Fetch_Hardware(clk, reset, instruction, pc_out);

    input clk;
    input reset;
    output [31:0] instruction;
    output [31:0] pc_out;

    reg [31:0] pc_current;
    wire [31:0] pc_next;

    // ----- Program Counter begins here -----
    always @(posedge clk or posedge reset)
    begin
        if(reset)
            pc_current <= 32'b0;
        else
            pc_current <= pc_next;
    end

    // ----- PC + 4 -----
    assign pc_next = pc_current + 32'b0100;

    Instruction_Memory IM(instruction, pc_current);

    assign pc_out = pc_current;
    
endmodule