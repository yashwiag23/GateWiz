`timescale 1ns/1ns
`include "xor_ff.v"

module xor_ff_tb;

    reg in, clk;
    wire out;

    xor_ff uut (in, clk, out);

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10ns period clock
    end

    initial begin
        // Dump waves for GTKWave
        $dumpfile("xor_ff_tb.vcd");
        $dumpvars(0, xor_ff_tb);

        // Initialize input
        in = 0;
        #10;

        // Change input synchronized with clock edges
        @(posedge clk);
        in = 1;
        @(posedge clk);
        in = 0;
        @(posedge clk);
        in = 1;

        // Let the simulation run a few clock cycles to observe output changes
        repeat (5) @(posedge clk);

        $display("Test complete");
        $finish;
    end

    // Optional: monitor signals every time they change
    initial
        $monitor("Time=%0t | clk=%b in=%b out=%b", $time, clk, in, out);

endmodule
