module pc(outputPC, inputPC, clk);

    input [31:0] inputPC;
    input clk;

    output [31:0] outputPC;

    always @(posedge clk)
    begin
        outputPC <= inputPC;
    end

endmodule