`timescale 1ns / 1ns
`include "subtractor.v"

module subtractor_tb;

    reg a, b;
    wire d, borrow;

   subtractor uut (a, b, d, borrow);

   initial begin

        $dumpfile("subtractor_tb.vcd");
        $dumpvars(0, subtractor_tb);

        $monitor("a = %b, b = %b | d = %b, borrow = %b", a, b, d, borrow);
        
        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;

        $display("test complete");
        $finish;

   end

endmodule