`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:23:14 11/11/2021 
// Design Name: 
// Module Name:    baggage_drop 
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
module baggage_drop(
    output   [6 : 0]   seven_seg1, 
    output   [6 : 0]   seven_seg2,
    output   [6 : 0]   seven_seg3,
    output   [6 : 0]   seven_seg4,
    output   [0 : 0]   drop_activated,
    input    [7 : 0]   sensor1,
    input    [7 : 0]   sensor2,
    input    [7 : 0]   sensor3,
    input    [7 : 0]   sensor4,
    input    [15: 0]   t_lim,
    input              drop_en
    );

	 wire [7:0] height; //iesirile modulului sensors_input
	 wire [15:0] out; //iesirile modulului square_root
	 wire [15:0] t_act; //intrarea modulului diplay_and_drop ce trebuie prelucrata 
	 
	 //formare legaturii sensors_input cu square_root
	 sensors_input Sensors_Input (height, sensor1, sensor2, sensor3, sensor4);
	 square_root Square_Root (out, height);
	 
	 //calcularea timpului final
	 assign t_act = out / 2;
	 
	 //formarea legaturii sensors_input, square_root cu display_and_drop
	 display_and_drop Display_And_Drop (seven_seg1, seven_seg2, seven_seg3, seven_seg4, drop_activated, t_act, t_lim, drop_en );
	 
endmodule
