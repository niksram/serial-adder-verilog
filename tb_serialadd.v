module tb;
    reg[15:0] t_a,t_b;
    reg mode,clk,reset;
    wire sum;
    ser_add sa(clk,reset,mode,t_a,t_b,sum);
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0,tb);
    end
    initial clk = 1'b0; always #5 clk =~ clk;
    initial begin
		$monitor(t_a,t_b,mode,sum);
    mode=1'b1;
    reset=1'b0;
    t_a=16'b1000100010001000;
    t_b=16'b0001000100010001;
    #5
    mode=1'b0;
    #5
    mode=1'b0;
    #5
    mode=1'b0;
    #5
    mode=1'b0;
    #5
    mode=1'b0;
    #5
    mode=1'b0;
    #5
    mode=1'b0;
    #5
    mode=1'b0;
    #5
    mode=1'b0;
    #5
    mode=1'b0;
    #5
    mode=1'b0;
    #5
    mode=1'b0;
    #5
    mode=1'b0;
    #5
    mode=1'b0;
    #5
    mode=1'b0;
end
endmodule