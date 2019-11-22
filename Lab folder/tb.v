module tb;
	reg t_a,t_b;
	wire t_sum,t_carry;
	HA ha(t_a,t_b,t_sum,t_carry);
	initial begin
		$dumpfile("Halfadder.vcd");
		$dumpvars(0,tb);
	end
	initial begin
		$monitor(t_a,t_b,t_carry,t_sum);
	t_a=1'b0;
	t_b=1'b0;
	#5
	t_a=1'b0;
	t_b=1'b1;
	#5
	t_a=1'b1;
	t_b=1'b0;
	#5
	t_a=1'b1;
	t_b=1'b1;	
	end
endmodule
