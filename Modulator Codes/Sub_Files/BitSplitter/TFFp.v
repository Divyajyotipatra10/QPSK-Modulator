`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.05.2024 23:49:11
// Design Name: 
// Module Name: TFFp
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


module TFFp(
    input clk,
    input reset,
    output reg tout
    );
    always @(posedge clk or posedge reset)
    begin
	   if(reset)
	   begin
		  tout<=0;
	   end
	   else
	   begin
		  tout<=~tout;
	   end
    end
endmodule
