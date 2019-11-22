`timescale 1ns / 1ps

module barrelShifter_tb;

 // Inputs

 reg [15:0] Ip;

 reg [3:0] shift_mag;

 // Outputs

 wire [15:0] Op;

 // Instantiate the Unit Under Test (UUT)

 barrelShifter uut (

  .Ip(Ip), 
  .Op(Op),
  .shift_mag(shift_mag)
  );
initial begin $dumpfile("shifter.vcd"); $dumpvars(0,barrelShifter_tb); end
 initial begin

  // Initialize Inputs

  Ip    = 16'd1;

  shift_mag = 4'd15;

  // Wait 100 ns for global reset to finish

  #100;

  Ip    = 16'd3;

  shift_mag = 4'd15;

  // Wait 100 ns for global reset to finish

  #100;

 end

endmodule