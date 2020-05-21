`include "AddSub.v"
`include "mux21.v"

module ALU1(Result,CarryOut,A,B,carryin,less,ALUop);
    
    output Result,CarryOut;
    input A,B,carryin,less;
    input [1:0] ALUop;

    addsub add1(addsubOut,CarryOut,A,B,carryin,ALUop[1]);
    
    xor #(50) xor1(xorOut,A,B);
    
    mux21 mux2(xorlessOut,xorOut,less,ALUop[1]);
    mux21 mux3(Result,addsubOut,xorlessOut,ALUop[0]);

endmodule