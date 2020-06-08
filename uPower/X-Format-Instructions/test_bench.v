`include "X_Format.v"

module  X_tb;

    reg [5:0] PO;
    reg [4:0] rs;
    reg [4:0] ra;
    reg [4:0] rb;
    reg [8:0] XO;
    reg [33:0] Rc;

    reg clk;
    
    wire [63:0] datars;
    wire [63:0] datara;
    wire [63:0] datarb;


    X_Format m(PO, rs, ra, rb, XO, Rc, clk, datars, datara, datarb);

    initial
        begin
            clk = 1'b0;
            repeat(100)
            #2 clk = ~clk;
        end

    initial
        begin
            $dumpfile("X_Format.vcd");
            $dumpvars(0, X_tb);

            ra = 5'b111; rs = 5'b1100; rb = 5'b1010; PO = 6'b011111; XO = 9'b000011100; Rc = 34'b00;
            #4 $display("\n\tInstruction = AND R7, R12, R10\n\tPO = %d \tXO = %d \n\tra = %d\trs = %d\trb = %d\t\n\tdatara = %b\n\tdatars = %b\n\tdatarb = %b\n",PO, XO, ra, rs, rb, datara, datars, datarb);

            ra = 5'b111; rs = 5'b1100; rb = 5'b1010; PO = 6'b011111; XO = 9'b111011100; Rc = 34'b00;
            #4 $display("\n\tInstruction = NAND R7, R12, R10\n\tPO = %d \tXO = %d \n\tra = %d\trs = %d\trb = %d\t\n\tdatara = %b\n\tdatars = %b\n\tdatarb = %b\n",PO, XO, ra, rs, rb, datara, datars, datarb);

            ra = 5'b111; rs = 5'b1100; rb = 5'b1010; PO = 6'b011111; XO = 9'b110111100; Rc = 34'b00;
            #4 $display("\n\tInstruction = OR R7, R12, R10\n\tPO = %d \tXO = %d \n\tra = %d\trs = %d\trb = %d\t\n\tdatara = %b\n\tdatars = %b\n\tdatarb = %b\n",PO, XO, ra, rs, rb, datara, datars, datarb);
           

        end

endmodule 