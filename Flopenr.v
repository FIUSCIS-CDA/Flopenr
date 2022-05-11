// Copyright (C) 2020  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and any partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details, at
// https://fpgasoftware.intel.com/eula.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"
// CREATED		"Wed May 11 12:10:53 2022"

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
