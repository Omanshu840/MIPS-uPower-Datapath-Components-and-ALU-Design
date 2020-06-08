`include "XO_Format.v"

module  XO_tb;

    reg [5:0] PO;
    reg [4:0] rt;
    reg [4:0] ra;
    reg [4:0] rb;
    reg [0:0] OE;
    reg [8:0] XO;
    reg [33:0] Rc;

    reg clk;
    
    wire [63:0] datart;
    wire [63:0] datara;
    wire [63:0] datarb;


    XO_Format m(PO, rt, ra, rb, OE, XO, Rc, clk, datart, datara, datarb);

    initial
        begin
            clk = 1'b0;
            repeat(100)
            #2 clk = ~clk;
        end

    initial
        begin
            $dumpfile("XO_Format.vcd");
            $dumpvars(0, XO_tb);

            rt = 5'b111; ra = 5'b010; rb = 5'b110; PO = 6'b011111; OE = 1'b0 ; XO = 9'b100001010; Rc = 34'b00;
            #4 $display("\n\tInstruction = ADD R7, R2, R6\n\tPO = %d \tXO = %d \n\trt = %d\tra = %d\trb = %d\t\n\tdatart = %d\t datara = %d\t datarb = %d\t\n",PO, XO, rt, ra, rb, datart, datara, datarb);

            rt = 5'b111; ra = 5'b011; rb = 5'b1001; PO = 6'b011111; OE = 1'b0 ; XO = 9'b000101000; Rc = 34'b00;
            #4 $display("\n\tInstruction = SUB R7, R3, R9\n\tPO = %d \tXO = %d \n\trt = %d\tra = %d\trb = %d\t\n\tdatart = %d\t datara = %d\t datarb = %d\t\n",PO, XO, rt, ra, rb, datart, datara, datarb);

                       

        end

endmodule 