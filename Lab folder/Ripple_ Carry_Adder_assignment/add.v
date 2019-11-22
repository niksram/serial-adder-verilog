//Module full adder.
module fadd(input wire a, b, cin, output wire sum, cout);
	wire x,y,z;
	xor3 fxor(a,b,cin,sum);
	and2 fand1(a,b,x);
	and2 fand2(b,cin,y);
	and2 fand3(a,cin,z);
	or3 for3(x,y,z,cout);
	

endmodule

// Module 4-bit ripple carry adder.

module fa4 (input wire [3:0] a, b, input wire cin, output wire [3:0] sum, output wire cout);
	wire [2:0] c;
	fadd fa1(a[0],b[0],cin,sum[0],c[0]);
	fadd fa2(a[1],b[1],c[0],sum[1],c[1]);
	fadd fa3(a[2],b[2],c[1],sum[2],c[2]);
	fadd fa4(a[3],b[3],c[2],sum[3],cout);

endmodule 


    
