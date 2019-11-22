module and2 (input wire i1,i2, output wire o1);
	assign o1=i1&i2;
endmodule
module or2 (input wire i1,i2, output wire o1);
	assign o1=i1|i2;
endmodule
module xor2 (input wire i1,i2, output wire o1);
	assign o1=i1^i2;
endmodule
module HA (input wire i1,i2, output wire sum,carry);
	and2 fand(i1,i2,carry);
	xor2 fxor(i1,i2,sum);
endmodule	
