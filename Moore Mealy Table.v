`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2024 11:17:19 AM
// Design Name: 
// Module Name: MooreMealy_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module MooreMealy_tb;
    reg clk, rst, seqIn;
    wire MooreDetect, MealyDetect;

    //instantiate Moore for "1100"
    moore moore_inst(
        .clk(clk),
        .rst(rst),
        .seqIn(seqIn),
        .detected(MooreDetect)
    );

    //instantiate Mealy for "1101"
    mealy mealy_inst(
        .clk(clk),
        .rst(rst),
        .seqIn(seqIn),
        .detected(MealyDetect)
    );

    // Clock generation (10ns period)
    always #5 clk = ~clk;

    // Test sequence
    initial begin
        // Initialize signals
        clk = 0;
        rst = 1;
        seqIn = 0;
       #10 rst = 0;


        
        //test both with different inputs 
        seqIn = 1; #10;  //"1"
        
        seqIn = 1; #10;  //"11"
        
        seqIn = 0; #10;  //"110"
        
        seqIn = 0; #10;  //"1100" for Moore FSM
        
        

        #10;
        rst = 1; #10;
        rst = 0; #10; 
        seqIn = 1; #10;  // Start "1" again
        
        seqIn = 1; #10;  // Continue "11"
        
        seqIn = 0; #10;  // Add "110"
        
        seqIn = 1; #10;  // Complete "1101" for Mealy FSM
        
        

        #100 $stop;
    end
endmodule
