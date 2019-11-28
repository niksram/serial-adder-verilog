module ser_add(input wire clk,reset,useTestBenchInputs, input wire[15:0] input1,input2, output wire sum);
	//
	
	// useTestBenchInputs must be 1 to parallel insert initially, then it must be made zero for the next subsequent bits.
	// To run the file
	// iverilog -o final lib.v serialadd.v tb_serialadd.v
	// vvp final
	// Then press ctrl + C and type "finish" in the prompt
	// gtkwave dump.vcd

	wire[15:0] registerA,registerB,shiftedRegA,shiftedRegB,regForInputA,regForInputB;
	wire regcout;
	wire lsbFromA,lsbFromB,carryIn,cout;


	rshift r1(registerA,1'b0,sum,shiftedRegA,lsbFromA);
	rshift r2(registerB,1'b1,sum,shiftedRegB,lsbFromB);


	mux15 m1(shiftedRegA,input1,useTestBenchInputs,regForInputA);
	mux15 m2(shiftedRegB,input2,useTestBenchInputs,regForInputB);
	mux2 mcarryIn(regcout,1'b0,useTestBenchInputs,carryIn);


	fadd fa(lsbFromA,lsbFromB,carryIn,sum,cout);
	register reg1(clk,reset,regForInputA,registerA);
	register reg2(clk,reset,regForInputB,registerB);
	dfrl c(clk,reset,1'b1,cout,regcout);
endmodule

module register(input wire clk,reset, input wire [15:0] in, output wire [15:0] out);
	dfrl df0(clk,reset,1'b1,in[0],out[0]);
	dfrl df1(clk,reset,1'b1,in[1],out[1]);
	dfrl df2(clk,reset,1'b1,in[2],out[2]);
	dfrl df3(clk,reset,1'b1,in[3],out[3]);
	dfrl df4(clk,reset,1'b1,in[4],out[4]);
	dfrl df5(clk,reset,1'b1,in[5],out[5]);
	dfrl df6(clk,reset,1'b1,in[6],out[6]);
	dfrl df7(clk,reset,1'b1,in[7],out[7]);
	dfrl df8(clk,reset,1'b1,in[8],out[8]);
	dfrl df9(clk,reset,1'b1,in[9],out[9]);
	dfrl df10(clk,reset,1'b1,in[10],out[10]);
	dfrl df11(clk,reset,1'b1,in[11],out[11]);
	dfrl df12(clk,reset,1'b1,in[12],out[12]);
	dfrl df13(clk,reset,1'b1,in[13],out[13]);
	dfrl df14(clk,reset,1'b1,in[14],out[14]);
	dfrl df15(clk,reset,1'b1,in[15],out[15]);
endmodule

module mux15(input wire[15:0] shiftedReg, initialInput,input wire useInitialInput, output wire[15:0] inputToMem);
	mux2 m0(shiftedReg[0],initialInput[0],useInitialInput,inputToMem[0]);
	mux2 m1(shiftedReg[1],initialInput[1],useInitialInput,inputToMem[1]);
	mux2 m2(shiftedReg[2],initialInput[2],useInitialInput,inputToMem[2]);
	mux2 m3(shiftedReg[3],initialInput[3],useInitialInput,inputToMem[3]);
	mux2 m4(shiftedReg[4],initialInput[4],useInitialInput,inputToMem[4]);
	mux2 m5(shiftedReg[5],initialInput[5],useInitialInput,inputToMem[5]);
	mux2 m6(shiftedReg[6],initialInput[6],useInitialInput,inputToMem[6]);
	mux2 m7(shiftedReg[7],initialInput[7],useInitialInput,inputToMem[7]);
	mux2 m8(shiftedReg[8],initialInput[8],useInitialInput,inputToMem[8]);
	mux2 m9(shiftedReg[9],initialInput[9],useInitialInput,inputToMem[9]);
	mux2 m10(shiftedReg[10],initialInput[10],useInitialInput,inputToMem[10]);
	mux2 m11(shiftedReg[11],initialInput[11],useInitialInput,inputToMem[11]);
	mux2 m12(shiftedReg[12],initialInput[12],useInitialInput,inputToMem[12]);
	mux2 m13(shiftedReg[13],initialInput[13],useInitialInput,inputToMem[13]);
	mux2 m14(shiftedReg[14],initialInput[14],useInitialInput,inputToMem[14]);
	mux2 m15(shiftedReg[15],initialInput[15],useInitialInput,inputToMem[15]);
endmodule

module rshift(input wire[15:0] in, input wire selectLsb, sum, output wire[15:0] out, output wire shft);
	assign shft=in[0];
	assign out[0]=in[1];
	assign out[1]=in[2];
	assign out[2]=in[3];
	assign out[3]=in[4];
	assign out[4]=in[5];
	assign out[5]=in[6];
	assign out[6]=in[7];
	assign out[7]=in[8];
	assign out[8]=in[9];
	assign out[9]=in[10];
	assign out[10]=in[11];
	assign out[11]=in[12];
	assign out[12]=in[13];
	assign out[13]=in[14];
	assign out[14]=in[15];
	
	// wire feedback;
	// Sum is to write back into the first register
	// Select is depends on whether the input to rshift
	// is the first or second shift register(A or B)
	mux2 m2(sum, in[0], selectLsb, out[15]);

	// assign out[15]=feedback;
endmodule

module fadd(input wire a, b, cin, output wire sum, cout);
	wire x,y,z;
	xor3 fxor(a,b,cin,sum);
	and2 fand1(a,b,x);
	and2 fand2(b,cin,y);
	and2 fand3(a,cin,z);
	or3 for3(x,y,z,cout);
endmodule