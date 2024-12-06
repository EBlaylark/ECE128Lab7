`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2024 03:11:23 PM
// Design Name: 
// Module Name: debouncer
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


module debouncer(clk,btn,clean);

    input clk;
    input btn;
    
    output reg clean;

    reg [19:0] counter = 0;
    reg btn_stable = 0;


    always @(posedge clk) begin
    
        if (btn == btn_stable) begin
        
            counter <= 0;
        end 
        else begin
            counter <= counter + 1;
            if (counter == 8'b11111111)
             begin
                btn_stable <= btn;
                clean <= btn;
                counter <= 0;
            end
        end
    end
endmodule