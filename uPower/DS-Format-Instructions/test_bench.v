`include "DS_Format.v"

module DS_tb;
    
    reg [5:0] PO;
    reg [4:0] rt;
    reg [4:0] ra;
    reg [14:0] DS;
    reg [32:0] XO;

    reg clk;

    wire [63:0] datart;
    wire [63:0] datara;

    DS_Format m(PO, rt, ra, DS, XO, clk, datart, datara);

    initial
        begin
            clk = 1'b0;
            repeat(100)
            #2 clk = ~clk;
        end

    initial
        begin
            $dumpfile("DS_Format.vcd");
            $dumpvars(0, DS_tb);

            PO = 6'b111010; ra = 5'b011; rt = 5'b010; DS = 16'b101; XO = 33'b0;
            #4 $display("\n\tInstruction = LD R2, 5(R3)\n\tPO = %d\n\trt = %d \t ra = %d\n\tdatart = %d \t datara = %d \t\n \n", PO, rt, ra, datart,datara);

            PO = 6'b111110; ra = 5'b011; rt = 5'b01001; DS = 16'b0111; XO = 33'b0;
            #4 $display("\n\tInstruction = STD R9, 7(R3)\n\tPO = %d\n\trt = %d \t ra = %d\n\tdatart = %d \t datara = %d \t\n \n", PO, rt, ra, datart,datara);

            PO = 6'b111010; ra = 5'b1010; rt = 5'b111; DS = 16'b00; XO = 33'b0;
            #4 $display("\n\tInstruction = LD R7, 0(R10)\n\tPO = %d\n\trt = %d \t ra = %d\n\tdatart = %d \t datara = %d \t\n \n", PO, rt, ra, datart,datara);


            // OpCode = 6'b101011; rs = 5'b011; rt = 5'b1001; imm = 16'b111;
            // #4 $display("\n\tInstruction = SW R9, 7(R3)\n\trs = %d \t rt = %d\n\tdatars = %d \t datart = %d \t\n \n",rs, rt, datars,datart);
           
            // OpCode = 6'b100011; rs = 5'b1010; rt = 5'b111; imm = 16'b000;
            // #4 $display("\n\tInstruction = LW R7, 0(R10)\n\trs = %d \t rt = %d\n\tdatars = %d \t datart = %d \t\n \n",rs, rt, datars,datart);

        end

endmodule 