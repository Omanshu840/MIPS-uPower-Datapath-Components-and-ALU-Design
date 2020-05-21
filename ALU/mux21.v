module mux21(O,A,B,sel);
    output O;
    input A,B,sel;
    not #(50) not1(nsel,sel);
    and #(50) and1(O1,A,nsel); 
    and #(50) and2(O2,B,sel);
    or #(50) or2(O,O1,O2);
endmodule