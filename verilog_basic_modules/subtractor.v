module subtractor (a, b, d, borrow);

    input a;
    input b;
    output reg d;
    output reg borrow;

    always @(*) begin
        case ({a, b})
            2'b00: begin
                d = 0;
                borrow = 0;
            end
            2'b01: begin
                d = 1;
                borrow = 1;
            end
            2'b10: begin
                d = 1;
                borrow = 0;
            end
            2'b11: begin
                d = 0;
                borrow = 0;
            end
        endcase
    end

endmodule