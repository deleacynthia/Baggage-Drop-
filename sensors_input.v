`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:44:40 11/10/2021 
// Design Name: 
// Module Name:    sensors_input 
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
module sensors_input(

	output   [7 : 0]   height,
   input    [7 : 0]   sensor1,
   input    [7 : 0]   sensor2,
   input    [7 : 0]   sensor3,
   input    [7 : 0]   sensor4);
    
	// variabile pt inaltimile auxiliare
	// inaltimea maxima este pe 10 biti
	reg [9:0] height1; 
	reg [9:0] height2;
	
	always @(*) begin
	
		// initializare variabile auxiliare
		height2 = 0;
		height1 = 0;
		
		//instructiune care calculeaza inaltimea 
		//in functie de senzorii disponibili
		if(sensor1 == 0 || sensor3 == 0)begin
			height2 = sensor2 + sensor4;
			if(height2[0] == 0)
				height1 = height2 / 2;
			else 
				height1 = height2 / 2 + 1;
		end
		
		else if(sensor2 == 0 || sensor4 == 0)begin
			height2 = sensor1 + sensor3;
			if(height2[0] == 0)
				height1 = height2 / 2;
			else 
				height1 = height2 / 2 + 1;
		end
		
		else begin
			height2 = sensor1 + sensor2 + sensor3 + sensor4;
			if(height2[1] == 0)
				height1 = height2 / 4;
			else
				height1 = height2 / 4 + 1;
		end
		
	end
	
	// atribuire output
	assign height = height1;
		
endmodule
