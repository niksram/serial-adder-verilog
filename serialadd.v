module ser_add(input wire clk,reset,mode, input wire[15:0] in1,in2, output wire sum);
	//mode must be 1 to parallel insert initially, then it must be made zero for the next subsequent bits.
	wire[15:0] reg1out,reg2out,sh1,sh2,mx1,mx2;
	wire regcout;
	wire s1,s2,cin,cout;


	rshift r1(reg1out,sh1,s1);
	rshift r2(reg2out,sh2,s2);


	mux15 m1(sh1,in1,mode,mx1);
	mux15 m2(sh2,in2,mode,mx2);
	mux2 mcin(regcout,1'b0,mode,cin);


	fadd fa(s1,s2,cin,sum,cout);
	register reg1(clk,reset,mx1,reg1out);
	register reg2(clk,reset,mx2,reg2out);
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

module mux15(input wire[15:0] in1, in2,input wire sel, output wire[15:0] out);
	mux2 m0(in1[0],in2[0],sel,out[0]);
	mux2 m1(in1[1],in2[1],sel,out[1]);
	mux2 m2(in1[2],in2[2],sel,out[2]);
	mux2 m3(in1[3],in2[3],sel,out[3]);
	mux2 m4(in1[4],in2[4],sel,out[4]);
	mux2 m5(in1[5],in2[5],sel,out[5]);
	mux2 m6(in1[6],in2[6],sel,out[6]);
	mux2 m7(in1[7],in2[7],sel,out[7]);
	mux2 m8(in1[8],in2[8],sel,out[8]);
	mux2 m9(in1[9],in2[9],sel,out[9]);
	mux2 m10(in1[10],in2[10],sel,out[10]);
	mux2 m11(in1[11],in2[11],sel,out[11]);
	mux2 m12(in1[12],in2[12],sel,out[12]);
	mux2 m13(in1[13],in2[13],sel,out[13]);
	mux2 m14(in1[14],in2[14],sel,out[14]);
	mux2 m15(in1[15],in2[15],sel,out[15]);
endmodule

module rshift(input wire[15:0] in, output wire[15:0] out, output wire shft);
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
	assign out[15]=in[15];
endmodule

module fadd(input wire a, b, cin, output wire sum, cout);
	wire x,y,z;
	xor3 fxor(a,b,cin,sum);
	and2 fand1(a,b,x);
	and2 fand2(b,cin,y);
	and2 fand3(a,cin,z);
	or3 for3(x,y,z,cout);
endmodule