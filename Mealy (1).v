`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2024 11:29:09 AM
// Design Name: 
// Module Name: mealy
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


module mealy(clk, rst, seqIn ,detected);
    input clk;
    input rst;
    input seqIn;
    output reg detected;
    
    //states 
    parameter S0 = 3'b000;
    parameter S1 = 3'b001;
    parameter S2 = 3'b010;
    parameter S3 = 3'b011;
    
   
    
    

    reg [2:0] state, next_state;
    reg detectedCOMB;


    //transition on clock edge or reset
    always @(posedge clk or posedge rst) 
    begin
    detected <= detectedCOMB;
        if (rst)
            state <= S0;
        else
            state <= next_state;
            
    end


    //next state logic with output assignment
    always @* begin
        //default
        detectedCOMB = 0;
        next_state = state;

        //transitions with output detection
        
         case (state)//1101
            S0: next_state = seqIn ? S1 : S0;//1
            S1: next_state = seqIn ? S2 : S0;//1
            S2: next_state = seqIn ? S2 : S3;//0
            S3: begin
                next_state = seqIn ? S1 : S0;
                if (seqIn == 1) detectedCOMB = 1; 
            end
            default: next_state = S0;
        endcase
    end
endmodule
