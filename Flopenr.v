// Copyright (C) 1991-2015 Altera Corporation. All rights reserved.
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, the Altera Quartus II License Agreement,
// the Altera MegaCore Function License Agreement, or other 
// applicable license agreement, including, without limitation, 
// that your use is for the sole purpose of programming logic 
// devices manufactured by Altera and sold by Altera or its 
// authorized distributors.  Please refer to the applicable 
// agreement for further details.

// PROGRAM		"Quartus II 64-Bit"
// VERSION		"Version 15.0.0 Build 145 04/22/2015 SJ Web Edition"
// CREATED		"Tue Feb  2 06:52:46 2021"

module Flopenr(
	reset,
	clk,
	D,
	E,
	Q
);


input wire	reset;
input wire	clk;
input wire	D;
input wire	E;
output wire	Q;

wire	master_output;
wire	NOTclk;
wire	slave_output;




assign	NOTclk =  ~clk;


DESwitch	b2v_master(
	.reset(reset),
	.clk(clk),
	.D(slave_output),
	.E(E),
	.Q(master_output));


DESwitch	b2v_slave(
	.reset(reset),
	.clk(NOTclk),
	.D(D),
	.E(E),
	.Q(slave_output));

assign	Q = master_output;

endmodule
