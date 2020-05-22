`include "R_Type.v"

module  R_tb;

    reg [4:0] rs;
    reg [4:0] rt;
    reg [4:0] rd;

    reg [5:0] funct;

    reg clk;

    wire [31:0] datars;
    wire [31:0] datart;
    wire [31:0] datard;

    R_Type m(rs, rt, rd, clk, funct, datars, datart, datard);

    initial
        begin
            clk = 1'b0;
            repeat(100)
            #2 clk = ~clk;
        end

    initial
        begin
            $dumpfile("R_type.vcd");
            $dumpvars(0, R_tb);
            rs = 5'b010; rt = 5'b110; rd = 5'b111; funct = 6'b100000;
            #4 $display("\tInstruction = ADD R7, R2, R6\n\trs = %d \t rt = %d \t rd = %d \n\tdatars = %d \t datart = %d \t datard = %d \n \n",rs, rt, rd, datars,datart,datard);


            // rs = 5'b010; rt = 5'b110; rd = 5'b111; funct = 6'b100010;
            // #4 $display("%g datars = %b datart = %b datard = %b instruction = SUB",$time,datars,datart,datard);
            // rs = 5'b010; rt = 5'b110; rd = 5'b111; funct = 6'b100100;
            // #4 $display("%g datars = %b datart = %b datard = %b instruction = AND",$time,datars,datart,datard);
            // rs = 5'b010; rt = 5'b110; rd = 5'b111; funct = 6'b100101;
            // #4 $display("%g datars = %b datart = %b datard = %b instruction = OR",$time,datars,datart,datard);
            // rs = 5'b010; rt = 5'b110; rd = 5'b111; funct = 6'b100111;
            // #4 $display("%g datars = %b datart = %b datard = %b instruction = NOR",$time,datars,datart,datard);
            // rs = 5'b010; rt = 5'b110; rd = 5'b111; funct = 6'b101110;
	        // #4 $display("%g datars = %b datart = %b datard = %b instruction = NAND",$time,datars,datart,datard);

            rs = 5'b111; rt = 5'b100; rd = 5'b011; funct = 6'b100000;
            #4 $display("\tInstruction = ADD R3, R7, R4\n\trs = %d \t rt = %d \t rd = %d \n\tdatars = %d \t datart = %d \t datard = %d \n \n",rs, rt, rd, datars,datart,datard);
        
            rs = 5'b111; rt = 5'b011; rd = 5'b01001; funct = 6'b100000;
            #4 $display("\tInstruction = ADD R9, R7, R3\n\trs = %d \t rt = %d \t rd = %d \n\tdatars = %d \t datart = %d \t datard = %d \n \n",rs, rt, rd, datars,datart,datard);

            rs = 5'b1001; rt = 5'b100; rd = 5'b1010; funct = 6'b100010;
            #4 $display("\tInstruction = SUB R10, R9, R4\n\trs = %d \t rt = %d \t rd = %d \n\tdatars = %d \t datart = %d \t datard = %d \n \n",rs, rt, rd, datars,datart,datard);

            rs = 5'b011; rt = 5'b111; rd = 5'b0100; funct = 6'b100100;
            #4 $display("\tInstruction = AND R4, R3, R7\n\trs = %d \t rt = %d \t rd = %d \n\tdatars = %b \t datart = %b \t datard = %b \n \n",rs, rt, rd, datars,datart,datard);            

        end

endmodule 