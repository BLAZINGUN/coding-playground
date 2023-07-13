module dff(clk,reset,din,q,qb);

input clk,reset,din;
output reg q;
output qb;

always@(posedge clk)
    begin
        if(reset)
            q<=0; 
        else
            q<=din;

        a1: assert property(p1)
            $display("flipflop working fine");
            else
            $display("flipflop not perfect");

    end

assign qb = ~q;


sequence s1;
    //din |=> (q == $past(din,1));
    (!din,disp) |=> ((q == $past(din,1)) , disp);
endsequence

property p1;
    @(posedge clk)
    disable iff(reset)

    (din,disp) |=> ((q == $past(din,1)),disp);
    s1;
endproperty

/*
property p2;
    @(posedge clk)
    disable iff(reset)

    !din |=> (q == $past(din,1));
endproperty
*/
task disp;

$display("at time t = %t, reset = %b , din = %b , q = %b , qb = %b" , $timeformat(-9,1,"ns",5),reset,din,q,qb);

endtask

endmodule



module dff_tb;

reg clk,reset,din;
wire q,qb;

dff DUT (clk,reset,din,q,qb);

initial
    begin
        clk = 0;
        forever 
            #5 clk = ~clk;
    end

initial
    begin
       #10 {din,reset} = 0;
       #10 reset = 1'b1;
       #10 reset = 1'b0;
       #10 din = 1'b1;
       #10 din = 1'b0;
       #100 $finish;
    end
    
initial
    $monitor("at time t = %t, reset = %b , din = %b , q = %b , qb = %b" , $timeformat(-9,1,"ns",5),reset,din,q,qb);

endmodule