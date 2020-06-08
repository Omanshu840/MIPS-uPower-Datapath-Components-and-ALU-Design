`include "D_Format.v"

module  D_tb;

    reg [5:0] PO;
    reg [4:0] rt;
    reg [4:0] ra;
    reg [47:0] SI;

    reg clk;
    
    wire [63:0] datart;
    wire [63:0] datara;


    D_Format m(PO, rt, ra, SI, clk, datart, datara);

    initial
        begin
            clk = 1'b0;
            repeat(100)
            #2 clk = ~clk;
        end

    initial
        begin
            $dumpfile("D_Format.vcd");
            $dumpvars(0, D_tb);

            rt = 5'b111; ra = 5'b1100; SI = 48'b1010; PO = 6'b001110;
            #4 $display("\n\tInstruction = ADDI R7, R12, 10\n\tPO = %d \tSI = %d \n\trt = %d\tra = %d\t\n\tdatart = %d\n\tdatara = %d\n",PO, SI, rt, ra, datart, datara);

            rt = 5'b111; ra = 5'b1100; SI = 48'b1010; PO = 6'b011100;
            #4 $display("\n\tInstruction = ANDI R7, R12, 10\n\tPO = %d\n\trt = %d\tra = %d\t\n\tdatart = %b\n\tSI = %b\n\tdatara = %b\n",PO, rt, ra, datart, SI, datara);

            rt = 5'b111; ra = 5'b1100; SI = 48'b1010; PO = 6'b011000;
            #4 $display("\n\tInstruction = ORI R7, R12, 10\n\tPO = %d\n\trt = %d\tra = %d\t\n\tdatart = %b\n\tSI = %b\n\tdatara = %b\n",PO, rt, ra, datart, SI, datara);


        end

endmodule 