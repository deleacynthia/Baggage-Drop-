`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:44:59 11/10/2021 
// Design Name: 
// Module Name:    square_root 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
 module square_root(
 
	 output [15:0] out,
	 input  [7:0] in );

	
	 reg [15:0] base;
	 reg [15:0] i;
	 reg [15:0] out2;
	 reg [31:0] in2; 
	 
	 
	 always @(*) begin
	 
		//initializare variabile auxiliare
		base = 16'b1000_0000_0000_0000;
		in2 = in;
		in2 = in2 << 16;
		out2 = 0;
		
		//16 iteratii pentru a modifica toti cei 16 biti ai iesirii
		for(i = 1; i <= 16; i = i + 1) begin
			out2 = out2+ base;
			if((out2 * out2) > in2)
				out2 = out2 - base;
			
			base = base >> 1;
		end
	end
	
	   //atribuire output
		assign out = out2;
endmodule
