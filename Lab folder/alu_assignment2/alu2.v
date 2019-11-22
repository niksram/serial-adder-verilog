// Write code for modules you need here
module fadd(input wire a, b, cin, output wire sum, cout);
	wire x,y,z;
	xor3 fxor(a,b,cin,sum);
	and2 fand1(a,b,x);
	and2 fand2(b,cin,y);
	and2 fand3(a,cin,z);
	or3 for3(x,y,z,cout);

endmodule


module alu1 (input wire [1:0] op, input wire a, b, cin ,output wire out, carry);
	wire s1,b1,ando,oro,m1;
	xor2 fxr1(b,op[0],b1);
	fadd f(a,b1,cin,s1,carry);
	and2 an1(a,b,ando);
	or2 o1(a,b,oro);
	mux2 mx1(ando,oro,op[0],m1);
	mux2 mx2(s1,m1,op[1],out);
	
endmodule	

module alu (input wire [1:0] op, input wire [15:0] i0, i1,
    output wire [15:0] o, output wire cout);
    wire [14:0] c;
	alu1 al0(op,i0[0],i1[0],op[0],o[0],c[0]);
	alu1 al1(op,i0[1],i1[1],c[0],o[1],c[1]);
	alu1 al2(op,i0[2],i1[2],c[1],o[2],c[2]);
	alu1 al3(op,i0[3],i1[3],c[2],o[3],c[3]);
	alu1 al4(op,i0[4],i1[4],c[3],o[4],c[4]);
	alu1 al5(op,i0[5],i1[5],c[4],o[5],c[5]);
	alu1 al6(op,i0[6],i1[6],c[5],o[6],c[6]);
	alu1 al7(op,i0[7],i1[7],c[6],o[7],c[7]);
	alu1 al8(op,i0[8],i1[8],c[7],o[8],c[8]);
	alu1 al9(op,i0[9],i1[9],c[8],o[9],c[9]);
	alu1 al10(op,i0[10],i1[10],c[9],o[10],c[10]);
	alu1 al11(op,i0[11],i1[11],c[10],o[11],c[11]);
	alu1 al12(op,i0[12],i1[12],c[11],o[12],c[12]);
	alu1 al13(op,i0[13],i1[13],c[12],o[13],c[13]);
	alu1 al14(op,i0[14],i1[14],c[13],o[14],c[14]);
	alu1 al15(op,i0[15],i1[15],c[14],o[15],cout);


endmodule

module add16(input wire [15:0] i0,i1, output wire [15:0] o, output wire cout);
	wire [14:0] c;
	fadd f1(i0[0] , i1[0] , 0,o[0],c[0]);
	fadd f2(i0[1] , i1[1] , c[0],o[1],c[1]);
	fadd f3(i0[2] , i1[2] , c[1],o[2],c[2]);
	fadd f4(i0[3] , i1[3] , c[2],o[3],c[3]);
	fadd f5(i0[4] , i1[4] , c[3],o[4],c[4]);
	fadd f6(i0[5] , i1[5] , c[4],o[5],c[5]);
	fadd f7(i0[6] , i1[6] , c[5],o[6],c[6]);
	fadd f8(i0[7] , i1[7] , c[6],o[7],c[7]);
	fadd f9(i0[8] , i1[8] , c[7],o[8],c[8]);
	fadd f10(i0[9] , i1[9] , c[8],o[9],c[9]);
	fadd f11(i0[10] , i1[10] , c[9],o[10],c[10]);
	fadd f12(i0[11] , i1[11] , c[10],o[11],c[11]);
	fadd f13(i0[12] , i1[12] , c[11],o[12],c[12]);
	fadd f14(i0[13] , i1[13] , c[12]0,o[13],c[13]);
	fadd f15(i0[14] , i1[14] , c[13]0,o[14],c[14]);
	fadd f16(i0[15] , i1[15] , c[14]0,o[15],cout);
	
endmodule

module sub16(input wire [15:0] i0,i1, output wire [15:0] o, output wire cout);
	wire [14:0] c;
	fadd f1(i0[0] , !i1[0] , 1,o[0],c[0]);
	fadd f2(i0[1] , !i1[1] , c[0],o[1],c[1]);
	fadd f3(i0[2] , !i1[2] , c[1],o[2],c[2]);
	fadd f4(i0[3] , !i1[3] , c[2],o[3],c[3]);
	fadd f5(i0[4] , !i1[4] , c[3],o[4],c[4]);
	fadd f6(i0[5] , !i1[5] , c[4],o[5],c[5]);
	fadd f7(i0[6] , !i1[6] , c[5],o[6],c[6]);
	fadd f8(i0[7] , !i1[7] , c[6],o[7],c[7]);
	fadd f9(i0[8] , !i1[8] , c[7],o[8],c[8]);
	fadd f10(i0[9] , !i1[9] , c[8],o[9],c[9]);
	fadd f11(i0[10] , !i1[10] , c[9],o[10],c[10]);
	fadd f12(i0[11] , !i1[11] , c[10],o[11],c[11]);
	fadd f13(i0[12] , !i1[12] , c[11],o[12],c[12]);
	fadd f14(i0[13] , !i1[13] , c[12]0,o[13],c[13]);
	fadd f15(i0[14] , !i1[14] , c[13]0,o[14],c[14]);
	fadd f16(i0[15] , !i1[15] , c[14]0,o[15],cout);
	
endmodule

module oro16(input wire [15:0] i0,i1, output wire [15:0] o output wire cout);
	or2 o1(i1[0],i2[0],o[0]);
	or2 o2(i1[1],i2[1],o[1]);
	or2 o3(i1[2],i2[2],o[2]);
	or2 o4(i1[3],i2[3],o[3]);
	or2 o5(i1[4],i2[4],o[4]);
	or2 o6(i1[5],i2[5],o[5]);
	or2 o7(i1[6],i2[6],o[6]);
	or2 o8(i1[7],i2[7],o[7]);
	or2 o9(i1[8],i2[8],o[8]);
	or2 o10(i1[9],i2[9],o[9]);
	or2 o11(i1[10],i2[10],o[10]);
	or2 o12(i1[11],i2[11],o[11]);
	or2 o13(i1[12],i2[12],o[12]);
	or2 o14(i1[13],i2[13],o[13]);
	or2 o15(i1[14],i2[14],o[14]);
	or2 o16(i1[15],i2[15],o[15]);
	assign cout=0;

endmodule

module and16(input wire [15:0] i0,i1, output wire [15:0] o, output wire cout);
	and2 o1(i1[0],i2[0],o[0]);
	and2 o2(i1[1],i2[1],o[1]);
	and2 o3(i1[2],i2[2],o[2]);
	and2 o4(i1[3],i2[3],o[3]);
	and2 o5(i1[4],i2[4],o[4]);
	and2 o6(i1[5],i2[5],o[5]);
	and2 o7(i1[6],i2[6],o[6]);
	and2 o8(i1[7],i2[7],o[7]);
	and2 o9(i1[8],i2[8],o[8]);
	and2 o10(i1[9],i2[9],o[9]);
	and2 o11(i1[10],i2[10],o[10]);
	and2 o12(i1[11],i2[11],o[11]);
	and2 o13(i1[12],i2[12],o[12]);
	and2 o14(i1[13],i2[13],o[13]);
	and2 o15(i1[14],i2[14],o[14]);
	and2 o16(i1[15],i2[15],o[15]);
	assign cout=0;
endmodule
