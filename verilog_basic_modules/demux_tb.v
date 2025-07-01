`timescale 1ns / 1ns
`include "demux.v"

module demux_tb;
    
    reg [99:0] data_in;
    reg control;
    wire [99:0] out1, out2;

    demux uut (data_in, control, out1, out2);

    initial begin

        $dumpfile("demux_tb.vcd");
        $dumpvars(0, demux_tb);

        $monitor("data_in = %b, control = %b | out1 = %b, out2 = %b", data_in, control, out1, out2);

        data_in = $random; 
        control = 0; #10;
        
        data_in = $random;
        control = 1; #10;
        
        $display("test complete");
        $finish;
        
    end
endmodule
