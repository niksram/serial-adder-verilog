module fadd(input wire a, b, cin, output wire sum, cout);
	wire x,y,z;
	xor3 fxor(a,b,cin,sum);
	and2 fand1(a,b,x);
	and2 fand2(b,cin,y);
	and2 fand3(a,cin,z);
	or3 for3(x,y,z,cout);
endmodule