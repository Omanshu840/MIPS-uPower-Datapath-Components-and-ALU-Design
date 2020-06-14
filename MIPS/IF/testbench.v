`include "if.v"

module instrmemstimulous();

    reg [31:0] addr;
    wire [31:0] instr;

    reg clk;

    initial
        begin
            clk = 1'b0;
            repeat(50)
            #4 clk = ~clk;
        end

    // InstructionMem instructionmemory(instr, addr);

    IFH IF1(addr, instr, clk);

    

    initial
    begin
        $dumpfile("ifh.vcd");
        $dumpvars(0,instrmemstimulous);
        $monitor("Mem Address=%h instruction=%b",addr,instr);
        addr=32'd0;
        // #10000 addr=32'd4;
        // #10000 addr=32'd8;
        // #10000 addr=32'd12;
        // #10000 addr=32'd16;
        // #10000 addr=32'd20;
        // #10000 addr=32'd24;
        // #10000 addr=32'd28;
        // #10000;
        // $finish;
    end

endmodule