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
