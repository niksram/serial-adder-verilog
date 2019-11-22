module tb;
    reg t_a,t_b;
    reg cin,clk,reset;
    wire t_sum,t_carry;
    serial_add sa(cin,t_a,t_b,t_sum,t_carry);
    initial begin
        $dumpfile("joke.vcd");
        $dumpvars(0,tb);
    end
    initial clk = 1'b0; always #5 clk =~ clk;
    initial reset = 1'b1; always #5 reset=1'b0;
    initial cin = 1'b0; always #5 cin=1'b0;
    initial begin
        $monitor(t_a,t_b,t_carry,t_sum);
    t_a=1'b0;
    t_b=1'b1;
    #5
    t_a=1'b0;
    t_b=1'b1;
    #5
    t_a=1'b0;
    t_b=1'b1;
    #5
    t_a=1'b0;
    t_b=1'b1;
    #5
    t_a=1'b0;
    t_b=1'b1; 
    #5
    t_a=1'b0;
    t_b=1'b1;
    #5
    t_a=1'b0;
    t_b=1'b1;
    #5
    #5 
    #5
    #5
    #5
    #5   
    #5
    #5
    #5 
    #5
    end
endmodule