module I_Type(r1,imm,r3,clk,funct,a,rd,b);

    input [4:0] r1;
    input [11:0] imm;              // 12-bit immediate value
    input [4:0] r3;
    input [5:0] funct;
    input clk;
    reg [63:0] regFile[0:31];
    output wire [31:0] a;
    output reg [31:0] b;           // 'b' converts 12 bit immediate value to 32 bits
    output wire [31:0] rd;
    wire cout, zero, overflow;
    integer i;
    initial
    begin
        for(i=0;i<32;i=i+1)
        begin
            regFile[i] <= i;
        end
    end
    //ReadModule
        assign a=regFile[r1];
        

        always@(*)
        begin
            b[11:0]= imm[11:0];
            b[31:12]={20{imm[11]}};
        end

        
    ALU64 m1(a,b,funct[3:0],funct[5:4],rd,cout,zero,overflow);
    //WriteModule
        always@(posedge clk)
        begin	
            regFile[r3] <= rd;
        end

endmodule