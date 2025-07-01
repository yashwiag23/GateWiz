module alarm_clock(
    input clk,
    input reset,
    input [1:0] H_in1,
    input [3:0] H_in0,
    input [2:0] M_in1,
    input [3:0] M_in0,
    input LD_time,
    input LD_alarm,
    input STOP_al,
    input AL_ON,
    output reg Alarm,
    output reg [1:0] H_out1,
    output reg [3:0] H_out0,
    output reg [2:0] M_out1,
    output reg [3:0] M_out0,
    output reg [2:0] S_out1,
    output reg [3:0] S_out0
);

    reg [1:0] H_alarm1;
    reg [3:0] H_alarm0;
    reg [2:0] M_alarm1;
    reg [3:0] M_alarm0;
    reg [2:0] S_alarm1;
    reg [3:0] S_alarm0;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            Alarm <= 0;
            H_out1 <= H_in1;
            H_out0 <= H_in0;
            M_out1 <= M_in1;
            M_out0 <= M_in0;
            S_out1 <= 0;
            S_out0 <= 0;
        end else begin
            // Load Alarm
            if (LD_alarm) begin
                H_alarm1 <= H_in1;
                H_alarm0 <= H_in0;
                M_alarm1 <= M_in1;
                M_alarm0 <= M_in0;
                S_alarm1 <= 0;
                S_alarm0 <= 0;
            end

            // Load Time
            if (LD_time) begin
                H_out1 <= H_in1;
                H_out0 <= H_in0;
                M_out1 <= M_in1;
                M_out0 <= M_in0;
                S_out1 <= 0;
                S_out0 <= 0;
            end else begin
                // Second counter logic
                if (S_out1 == 3'd5 && S_out0 == 4'd9) begin
                    S_out1 <= 0;
                    S_out0 <= 0;

                    // Minute counter
                    if (M_out1 == 3'd5 && M_out0 == 4'd9) begin
                        M_out1 <= 0;
                        M_out0 <= 0;

                        // Hour counter
                        if (H_out1 == 2'd2 && H_out0 == 4'd3) begin
                            H_out1 <= 0;
                            H_out0 <= 0;
                        end else begin
                            if (H_out0 == 4'd9) begin
                                H_out0 <= 0;
                                H_out1 <= H_out1 + 1;
                            end else begin
                                H_out0 <= H_out0 + 1;
                            end
                        end
                    end else begin
                        if (M_out0 == 4'd9) begin
                            M_out0 <= 0;
                            M_out1 <= M_out1 + 1;
                        end else begin
                            M_out0 <= M_out0 + 1;
                        end
                    end
                end else begin
                    if (S_out0 == 4'd9) begin
                        S_out0 <= 0;
                        S_out1 <= S_out1 + 1;
                    end else begin
                        S_out0 <= S_out0 + 1;
                    end
                end
            end

            // Alarm check
            if (H_out1 == H_alarm1 && H_out0 == H_alarm0 &&
                M_out1 == M_alarm1 && M_out0 == M_alarm0) begin
                if (AL_ON)
                    Alarm <= 1;
            end

            if (STOP_al)
                Alarm <= 0;
        end
    end

endmodule
