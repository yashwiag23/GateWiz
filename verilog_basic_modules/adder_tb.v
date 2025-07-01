`timescale 1ns / 1ns
`include "adder.v"

module adder_tb;

    reg a, b, cin;
    wire sum, cout;

   adder uut (a, b, cin, sum, cout);

   initial begin

        $dumpfile("adder_tb.vcd");
        $dumpvars(0, adder_tb);

        $monitor("a = %b, b = %b, cin = %b | sum = %b, cout = %b", a, b, cin, sum, cout);
        
        a = 0; b = 0; cin = 0; #10;
        a = 0; b = 0; cin = 1; #10;
        a = 0; b = 1; cin = 0; #10;
        a = 0; b = 1; cin = 1; #10;
        a = 1; b = 0; cin = 0; #10;
        a = 1; b = 0; cin = 1; #10;
        a = 1; b = 1; cin = 0; #10;
        a = 1; b = 1; cin = 1; #10;

        $display("test complete");
        $finish;

   end

endmodule