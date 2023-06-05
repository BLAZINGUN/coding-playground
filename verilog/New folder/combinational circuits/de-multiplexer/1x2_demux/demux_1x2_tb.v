`timescale 10 ns/10ps

module demux_1x2_tb;

reg din,s;
wire y0,y1;


demux_1x2 DUT (din,s,y0,y1);

initial 
begin

din = 0;
s=0;
#100 $finish;


$monitor ("at time = %t , din = %b , s=%b, y0=%b, y1=%b ", $time , din , s , y0 , y1 )


#10 din = 1 , s = 0 ;
#10 din = 0 , s = 1 ;
#10 din = 1 , s = 1 ;
#10 din = 1 , s = 0 ;

end

endmodule




