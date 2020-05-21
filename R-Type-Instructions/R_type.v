
module R_Type(r1, r2, r3, clk, funct, rs, rt, rd);

    input [4:0] r1;
    input [4:0] r2;
    input [4:0] r3;
    input [5:0] funct;
    input clk;

    reg [31:0] regFile[0:31];
    
    output wire [31:0] rs;
    output wire [31:0] rt;
    output wire [31:0] rd;

    wire carryout, zero, overflow;

    integer i;
    
    initial
    begin
        for (i=0; i<31; i++)
        begin
            regFile[i] <= 31'b10101;
        end
    end

    assign rs = regFile[r1];
    assign rt = regFile[r2];

    ALU64 m1(rd, carryout, zero, overflow, funct[3:0], rs, rt, funct[5:4]);

    always@(posedge clk)
    begin
        regfile[r3] <= rd;
    end

endmodule