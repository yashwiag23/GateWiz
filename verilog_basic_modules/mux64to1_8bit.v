module mux64to1_8bit (sel, vault, treasure);

    input [5:0] sel;
    input [511:0] vault; 
    output [7:0] treasure;

    assign treasure = vault[sel*8 +: 8];  // Select the correct 8 bits

endmodule
