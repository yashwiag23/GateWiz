`timescale 1ns / 1ns
`include "mux64to1_8bit.v"

module mux64to1_8bit_tb;
    
    reg [5:0] sel;
    reg [511:0] vault; 
    wire [7:0] treasure;

    mux64to1_8bit uut (sel, vault, treasure);

    initial begin
        $dumpfile("mux64to1_8bit_tb.vcd");
        $dumpvars(0, mux64to1_8bit_tb);

        vault = {$random, $random, $random, $random, $random, $random, $random, $random, $random, $random, $random, $random, $random, $random, $random, $random}; // Sample vault data
        sel = $random; // Test the first compartment
        #20; 
        $display("sel = %0d, vault = %h | treasure = %h", sel, vault, treasure);
    
        sel = $random; // Test the second compartment
        #20;
        $display("sel = %0d, treasure = %b", sel, treasure);
    
        // Repeat for other values of 'sel' if needed
        $display("test complete");
        $finish;
    end

endmodule
