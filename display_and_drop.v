`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:45:32 11/10/2021 
// Design Name: 
// Module Name:    display_and_drop 
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
module display_and_drop(

    output   [6 : 0]   seven_seg1, 
    output   [6 : 0]   seven_seg2,
    output   [6 : 0]   seven_seg3,
    output   [6 : 0]   seven_seg4,
    output   [0 : 0]   drop_activated,
    input    [15: 0]   t_act,
    input    [15: 0]   t_lim,
    input              drop_en);

	reg [6:0] seven_seg1_reg;
	reg [6:0] seven_seg2_reg;
	reg [6:0] seven_seg3_reg;
	reg [6:0] seven_seg4_reg;
	
	reg [0:0] drop_activated1;

	
	always@(*) begin
		//conditia de lansare nu este indeplinita
		if(drop_en == 0) begin 
		
			//t_act este sub t_lim
			if(t_lim >= t_act) begin
			
				//semnalul de alarma nu este activ
				drop_activated1 = 0;
				
				//pe display se afiseaza COLD
				seven_seg1_reg = 7'b0111001; //C
				seven_seg2_reg = 7'b1011100; //O
				seven_seg3_reg = 7'b0111000; //L
				seven_seg4_reg = 7'b1011110; //D
			end 
		end
		
		//conditia de lansare este indeplinita
		else if(drop_en == 1) begin
		
			//t_act este sub t_lim
			if(t_lim > t_act) begin
			
				//semnalul de alarma este activ
				drop_activated1 = 1;
				
				//pe display se afiseaza DROP
				seven_seg1_reg = 7'b1011110; //D
				seven_seg2_reg = 7'b1010000; //R
				seven_seg3_reg = 7'b1011100; //O
				seven_seg4_reg = 7'b1110011; //P
			end
			
			//t_act este peste t_lim
			else if(t_act > t_lim) begin
			
						//semnalul de alarma nu este activ
						drop_activated1 = 0;
						
						//pe display se afiseaza HOT
						seven_seg1_reg = 7'b0000000; // este stins
						seven_seg2_reg = 7'b1110110; //H
						seven_seg3_reg = 7'b1011100; //O
						seven_seg4_reg = 7'b1111000; //T
						
			end
		 end
    end

// atribuire output-uri
assign seven_seg1 = seven_seg1_reg;
assign seven_seg2 = seven_seg2_reg;
assign seven_seg3 = seven_seg3_reg;
assign seven_seg4 = seven_seg4_reg;

assign drop_activated = drop_activated1;

endmodule
