`timescale 1ns/1ns
`include "alarm_clock.v"

module alarm_clock_tb;

    reg clk;
    reg reset;
    reg [1:0] H_in1;
    reg [3:0] H_in0;
    reg [2:0] M_in1;
    reg [3:0] M_in0;
    reg LD_time;
    reg LD_alarm;
    reg STOP_al;
    reg AL_ON;

    wire Alarm;
    wire [1:0] H_out1;
    wire [3:0] H_out0;
    wire [2:0] M_out1;
    wire [3:0] M_out0;
    wire [2:0] S_out1;
    wire [3:0] S_out0;

    alarm_clock uut (
        .clk(clk),
        .reset(reset),
        .H_in1(H_in1),
        .H_in0(H_in0),
        .M_in1(M_in1),
        .M_in0(M_in0),
        .LD_time(LD_time),
        .LD_alarm(LD_alarm),
        .STOP_al(STOP_al),
        .AL_ON(AL_ON),
        .Alarm(Alarm),
        .H_out1(H_out1),
        .H_out0(H_out0),
        .M_out1(M_out1),
        .M_out0(M_out0),
        .S_out1(S_out1),
        .S_out0(S_out0)
    );

    always #5 clk = ~clk; // 10ns clock period

    initial begin
        $dumpfile("alarm_clock_tb.vcd");
        $dumpvars(0, alarm_clock_tb);

        // Initialization
        clk = 0;
        reset = 1;
        LD_time = 0;
        LD_alarm = 0;
        STOP_al = 0;
        AL_ON = 1;

        H_in1 = 2'd0; H_in0 = 4'd4;  // 04:59
        M_in1 = 3'd5; M_in0 = 4'd9;

        #20 reset = 0;

        // Load current time
        #20 LD_time = 1;
        #10 LD_time = 0;

        // Load alarm for 05:00
        #20 H_in1 = 2'd0; H_in0 = 4'd5;
             M_in1 = 3'd0; M_in0 = 4'd0;

        #10 LD_alarm = 1;
        #10 LD_alarm = 0;

        // Wait until alarm matches (~60s)
        #2000 STOP_al = 1;
        #20 STOP_al = 0;

        #100 $finish;
    end

endmodule
