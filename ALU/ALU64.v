`include "ALU1.v"

module alu(Result, CarryOut, Zero, Overflow, negative, A, B, ALUop);
    
    
    output CarryOut,Overflow,negative,Zero;
    output [31:0] Result;
    input [31:0] A,B;
    input [1:0] ALUop;
    wire lessthan;
    wire [31:0] crrout;

    
    
    ALU1 alu0(Result[0],crrout[0],A[0],B[0],ALUop[1],lessthan,ALUop);
    ALU1 alu1(Result[1],crrout[1],A[1],B[1],crrout[0],1'b0,ALUop);
    ALU1 alu2(Result[2],crrout[2],A[2],B[2],crrout[1],1'b0,ALUop);
    ALU1 alu3(Result[3],crrout[3],A[3],B[3],crrout[2],1'b0,ALUop);
    ALU1 alu4(Result[4],crrout[4],A[4],B[4],crrout[3],1'b0,ALUop);
    ALU1 alu5(Result[5],crrout[5],A[5],B[5],crrout[4],1'b0,ALUop);
    ALU1 alu6(Result[6],crrout[6],A[6],B[6],crrout[5],1'b0,ALUop);
    ALU1 alu7(Result[7],crrout[7],A[7],B[7],crrout[6],1'b0,ALUop);
    ALU1 alu8(Result[8],crrout[8],A[8],B[8],crrout[7],1'b0,ALUop);
    ALU1 alu9(Result[9],crrout[9],A[9],B[9],crrout[8],1'b0,ALUop);
    ALU1 alu10(Result[10],crrout[10],A[10],B[10],crrout[9],1'b0,ALUop);
    ALU1 alu11(Result[11],crrout[11],A[11],B[11],crrout[10],1'b0,ALUop);
    ALU1 alu12(Result[12],crrout[12],A[12],B[12],crrout[11],1'b0,ALUop);
    ALU1 alu13(Result[13],crrout[13],A[13],B[13],crrout[12],1'b0,ALUop);
    ALU1 alu14(Result[14],crrout[14],A[14],B[14],crrout[13],1'b0,ALUop);
    ALU1 alu15(Result[15],crrout[15],A[15],B[15],crrout[14],1'b0,ALUop);
    ALU1 alu16(Result[16],crrout[16],A[16],B[16],crrout[15],1'b0,ALUop);
    ALU1 alu17(Result[17],crrout[17],A[17],B[17],crrout[16],1'b0,ALUop);
    ALU1 alu18(Result[18],crrout[18],A[18],B[18],crrout[17],1'b0,ALUop);
    ALU1 alu19(Result[19],crrout[19],A[19],B[19],crrout[18],1'b0,ALUop);
    ALU1 alu20(Result[20],crrout[20],A[20],B[20],crrout[19],1'b0,ALUop);
    ALU1 alu21(Result[21],crrout[21],A[21],B[21],crrout[20],1'b0,ALUop);
    ALU1 alu22(Result[22],crrout[22],A[22],B[22],crrout[21],1'b0,ALUop);
    ALU1 alu23(Result[23],crrout[23],A[23],B[23],crrout[22],1'b0,ALUop);
    ALU1 alu24(Result[24],crrout[24],A[24],B[24],crrout[23],1'b0,ALUop);
    ALU1 alu25(Result[25],crrout[25],A[25],B[25],crrout[24],1'b0,ALUop);
    ALU1 alu26(Result[26],crrout[26],A[26],B[26],crrout[25],1'b0,ALUop);
    ALU1 alu27(Result[27],crrout[27],A[27],B[26],crrout[26],1'b0,ALUop);
    ALU1 alu28(Result[28],crrout[28],A[28],B[28],crrout[27],1'b0,ALUop);
    ALU1 alu29(Result[29],crrout[29],A[29],B[29],crrout[28],1'b0,ALUop);
    ALU1 alu30(Result[30],crrout[30],A[30],B[30],crrout[29],1'b0,ALUop);
    ALU1 alu31(Result[31],crrout[31],A[31],B[31],crrout[30],1'b0,ALUop);
    
    
    not #(50) notcarry(notcr31,crrout[31]);
    // Carryout = Not carry out 31 if it is subtraction
    
    
    mux21 muxcarry31(CarryOut,crrout[31],notcr31,ALUop[1]);
    
    
    xor #(50) xor5(Overflow,crrout[30],crrout[31]);
    // SLT
    
    
    addsub add2(addsub31Out,crrout31,A[31],B[31],crrout[30],ALUop[1]);
    
    
    xor #(50) xor6(lessthan,Overflow,addsub31Out);
    assign negative = Result[31];
    
    
    or #(50) or1(o1,Result[0],Result[1],Result[2],Result[3]);
    or #(50) or2(o2,Result[4],Result[5],Result[6],Result[7]);
    or #(50) or3(o3,Result[8],Result[9],Result[10],Result[11]);
    or #(50) or4(o4,Result[12],Result[13],Result[14],Result[15]);
    or #(50) or5(o5,Result[16],Result[17],Result[18],Result[19]);
    or #(50) or6(o6,Result[20],Result[21],Result[22],Result[23]);
    or #(50) or7(o7,Result[24],Result[25],Result[26],Result[27]);
    or #(50) or8(o8,Result[28],Result[29],Result[30],Result[31]);
    
    
    or #(50) or9(o9,o1,o2,o3,o4);
    or #(50) or10(o10,o5,o6,o7,o8);
    nor #(50) nor1(Zero,o9,o10);


endmodule