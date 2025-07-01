module demux (data_in, control, out1, out2);
    input [99:0] data_in;
    input control;
    output [99:0] out1;
    output [99:0] out2;

    assign out1 = (control == 0) ? data_in : 100'b0;
    assign out2 = (control == 1) ? data_in : 100'b0;

endmodule
