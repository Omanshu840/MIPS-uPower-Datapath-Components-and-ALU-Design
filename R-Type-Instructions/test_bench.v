`include "R_Type.v"

module  

    reg [4:0] r1;
    reg [4:0] r2;
    reg [4:0] r3;

    reg [4:0] funct;

    reg clk;

    wire [31:0] rs;
    wire [31:0] rt;
    wire [31:0] rd;

    R_Type m(r1, r2, r3, clk, funct, rs, rt, rd);

    initial
        begin
            $dumpfile("R_type.vcd");
            $dumpvars(0, R_tb);
            r1 = 5'b010; r2 = 5'b110; r3 = 5'b111; funct = 6'b100000;
            #2 $display("%g rs = %b rt = %b rd = %b instruction = ADD",$time,rs,rt,rd);
            r1 = 5'b010; r2 = 5'b110; r3 = 5'b111; funct = 6'b101000;
            #4 $display("%g rs = %b rt = %b rd = %b instruction = SUB",$time,rs,rt,rd);
            r1 = 5'b010; r2 = 5'b110; r3 = 5'b111; funct = 6'b100111;
            #4 $display("%g rs = %b rt = %b rd = %b instruction = AND",$time,rs,rt,rd);
            r1 = 5'b010; r2 = 5'b110; r3 = 5'b111; funct = 6'b100110;
            #4 $display("%g rs = %b rt = %b rd = %b instruction = OR",$time,rs,rt,rd);
            r1 = 5'b010; r2 = 5'b110; r3 = 5'b111; funct = 6'b101111;
            #4 $display("%g rs = %b rt = %b rd = %b instruction = NOR",$time,rs,rt,rd);
            r1 = 5'b010; r2 = 5'b110; r3 = 5'b111; funct = 6'b101110;
	        #4 $display("%g rs = %b rt = %b rd = %b instruction = NAND",$time,rs,rt,rd);
        end

endmodule 