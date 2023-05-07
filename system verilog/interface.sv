interface bridge_if (input bit clock);

logic a,b,c,d;
logic [1:0] e,f;


//input skew  : amount of time before the clock edge , the TB samples the DUT outputs.
//output skew : amount of time after the clock edge  , the TB drives the DUT inputs.


clocking cb1@(posedge clock);
    default input #1 output #1;

    input a,b;
    output d,f;

endclocking


clocking cb2@(negedge clock)

    default input #1 output #1;

    input c,f;
    output d,e;

endclocking


modport wr_mp (clocking cb1);
modport rd_mp (clocking cb2);



    
endinterface 




module bridge_top (input clk);

bridge_if if1(clk);

bridge DUT(if1);
tb     TB (if1);

initial 

begin
    //..........
end
    
endmodule