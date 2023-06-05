`timescale 10 ns/10ps

module demux_1x4_tb;

reg din,s0,s1;
wire y0,y1,y2,y3;


demux_1x2 DUT (din,s0,s1,y0,y1,y2,y3);

initial 
begin

din = 0;
s0=0;
s1=1;

#100 $finish;


$monitor ("at time = %t , din = %b , s0=%b, s1=%b, y0=%b, y1=%b, y2=%b, , y3=%b,  ", $time , din , s0 , s1 , y0 , y1 , y2 , y3 )


#10 din = 1 , s0 = 0 , s1 = 1  ; 
#10 din = 1 , s0 = 1 , s1 = 1  ; 
#10 din = 1 , s0 = 1 , s1 = 0  ; 
#10 din = 1 , s0 = 0 , s1 = 0  ; 

end

endmodule

