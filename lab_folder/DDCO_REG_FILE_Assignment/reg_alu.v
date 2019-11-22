// Write code for modules you need here


module reg_file (input wire clk, reset, wr, input wire [2:0] rd_addr_a, rd_addr_b, wr_addr, input wire [15:0] d_in, output wire [15:0] d_out_a, d_out_b);
	wire [7:0] load;
	wire [15:0] out0,out1,out2,out3,out4,out5,out6,out7;
	demux8 dm1(wr,wr_addr[2],wr_addr[1],wr_addr[0],load);
	regi r0(clk,reset,load[0],d_in,out0);
	regi r1(clk,reset,load[1],d_in,out1);
	regi r2(clk,reset,load[2],d_in,out2);
	regi r3(clk,reset,load[3],d_in,out3);
	regi r4(clk,reset,load[4],d_in,out4);
	regi r5(clk,reset,load[5],d_in,out5);
	regi r6(clk,reset,load[6],d_in,out6);
	regi r7(clk,reset,load[7],d_in,out7);
	muxout a(out0,out1,out2,out3,out4,out5,out6,out7,rd_addr_a,d_out_a);
	muxout b(out0,out1,out2,out3,out4,out5,out6,out7,rd_addr_b,d_out_b);

   
endmodule

module muxout(input wire [15:0] i7,i6,i5,i4,i3,i2,i1,i0,input wire [2:0] sel, output wire [15:0] o);
	mux8 m0({i0[0],i1[0],i2[0],i3[0],i4[0],i5[0],i6[0],i7[0]},sel[2],sel[1],sel[0],o[0]);
	mux8 m1({i0[1],i1[1],i2[1],i3[1],i4[1],i5[1],i6[1],i7[1]},sel[2],sel[1],sel[0],o[1]);
	mux8 m2({i0[2],i1[2],i2[2],i3[2],i4[2],i5[2],i6[2],i7[2]},sel[2],sel[1],sel[0],o[2]);
	mux8 m3({i0[3],i1[3],i2[3],i3[3],i4[3],i5[3],i6[3],i7[3]},sel[2],sel[1],sel[0],o[3]);
	mux8 m4({i0[4],i1[4],i2[4],i3[4],i4[4],i5[4],i6[4],i7[4]},sel[2],sel[1],sel[0],o[4]);
	mux8 m5({i0[5],i1[5],i2[5],i3[5],i4[5],i5[5],i6[5],i7[5]},sel[2],sel[1],sel[0],o[5]);
	mux8 m6({i0[6],i1[6],i2[6],i3[6],i4[6],i5[6],i6[6],i7[6]},sel[2],sel[1],sel[0],o[6]);
	mux8 m7({i0[7],i1[7],i2[7],i3[7],i4[7],i5[7],i6[7],i7[7]},sel[2],sel[1],sel[0],o[7]);
	mux8 m8({i0[8],i1[8],i2[8],i3[8],i4[8],i5[8],i6[8],i7[8]},sel[2],sel[1],sel[0],o[8]);
	mux8 m9({i0[9],i1[9],i2[9],i3[9],i4[9],i5[9],i6[9],i7[9]},sel[2],sel[1],sel[0],o[9]);
	mux8 m10({i0[10],i1[10],i2[10],i3[10],i4[10],i5[10],i6[10],i7[10]},sel[2],sel[1],sel[0],o[10]);
	mux8 m11({i0[11],i1[11],i2[11],i3[11],i4[11],i5[11],i6[11],i7[11]},sel[2],sel[1],sel[0],o[11]);
	mux8 m12({i0[12],i1[12],i2[12],i3[12],i4[12],i5[12],i6[12],i7[12]},sel[2],sel[1],sel[0],o[12]);
	mux8 m13({i0[13],i1[13],i2[13],i3[13],i4[13],i5[13],i6[13],i7[13]},sel[2],sel[1],sel[0],o[13]);
	mux8 m14({i0[14],i1[14],i2[14],i3[14],i4[14],i5[14],i6[14],i7[14]},sel[2],sel[1],sel[0],o[14]);
	mux8 m15({i0[15],i1[15],i2[15],i3[15],i4[15],i5[15],i6[15],i7[15]},sel[2],sel[1],sel[0],o[15]);
endmodule

module regi (input wire clk,reset,load, input wire [15:0] d_in, output wire [15:0] d_out);
	dfrl f0(clk,reset,load,d_in[0],d_out[0]);
	dfrl f1(clk,reset,load,d_in[1],d_out[1]);
	dfrl f2(clk,reset,load,d_in[2],d_out[2]);
	dfrl f3(clk,reset,load,d_in[3],d_out[3]);
	dfrl f4(clk,reset,load,d_in[4],d_out[4]);
	dfrl f5(clk,reset,load,d_in[5],d_out[5]);
	dfrl f6(clk,reset,load,d_in[6],d_out[6]);
	dfrl f7(clk,reset,load,d_in[7],d_out[7]);
	dfrl f8(clk,reset,load,d_in[8],d_out[8]);
	dfrl f9(clk,reset,load,d_in[9],d_out[9]);
	dfrl f10(clk,reset,load,d_in[10],d_out[10]);
	dfrl f11(clk,reset,load,d_in[11],d_out[11]);
	dfrl f12(clk,reset,load,d_in[12],d_out[12]);
	dfrl f13(clk,reset,load,d_in[13],d_out[13]);
	dfrl f14(clk,reset,load,d_in[14],d_out[14]);
	dfrl f15(clk,reset,load,d_in[15],d_out[15]);
endmodule


module reg_alu (input wire clk, reset, sel, wr, input wire [1:0] op, input wire [2:0] rd_addr_a,
		rd_addr_b, wr_addr, input wire [15:0] d_in, output wire [15:0] d_out_a, d_out_b, output wire cout);
		wire [15:0] din,aluout;
		wire out;
		muxalu mx(d_in,aluout,sel,din);
		reg_file register(clk,reset,wr,rd_addr_a,rd_addr_b,wr_addr,din,d_out_a,d_out_b);
		alu alunit(op,d_out_a,d_out_b,aluout,out); 
		dfr dfr1(clk,reset,out,cout);
endmodule

module muxalu (input wire [15:0] i0,i1, input wire sel, output wire [15:0] o);
	mux2 m0(i0[0],i1[0],sel,o[0]);
	mux2 m1(i0[1],i1[1],sel,o[1]);
	mux2 m2(i0[2],i1[2],sel,o[2]);
	mux2 m3(i0[3],i1[3],sel,o[3]);
	mux2 m4(i0[4],i1[4],sel,o[4]);
	mux2 m5(i0[5],i1[5],sel,o[5]);
	mux2 m6(i0[6],i1[6],sel,o[6]);
	mux2 m7(i0[7],i1[7],sel,o[7]);
	mux2 m8(i0[8],i1[8],sel,o[8]);
	mux2 m9(i0[9],i1[9],sel,o[9]);
	mux2 m10(i0[10],i1[10],sel,o[10]);
	mux2 m11(i0[11],i1[11],sel,o[11]);
	mux2 m12(i0[12],i1[12],sel,o[12]);
	mux2 m13(i0[13],i1[13],sel,o[13]);
	mux2 m14(i0[14],i1[14],sel,o[14]);
	mux2 m15(i0[15],i1[15],sel,o[15]);
endmodule
// Declare wires here

// Instantiate modules here


