`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2024 11:05:59 AM
// Design Name: 
// Module Name: moore
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


module moore(clk, rst, seqIn, detected);
    input clk;
    input rst;
    input seqIn;
    output reg detected;
    
    //states
    parameter S0 = 3'b000;
    parameter S1 = 3'b001;
    parameter S2 = 3'b010;
    parameter S3 = 3'b011;
    parameter S4 = 3'b100;
    
    
    reg [2:0] state, next_state;

    //transition on either clock edge or reset
    always @(posedge clk or posedge rst) begin
        if (rst)
            state <= S0;
        else
            state <= next_state;
    end



    //next state logic & output assignment
    always @* begin
    
    
        //default
        detected = 0;
        next_state = state;

        //transitions & output detection
        
        case (state) //1100
            S0: next_state = seqIn ? S1 : S0; //1
            S1: next_state = seqIn ? S2 : S0; //1
            S2: next_state = seqIn ? S2 : S3; //0
            S3: next_state = seqIn ? S3 : S4; //0
            S4: begin
                detected = 1;      
                next_state = S0;   
            end
            default: next_state = S0;
        endcase
    end
endmodule
