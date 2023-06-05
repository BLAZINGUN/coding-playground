`timescale 10ns/10ps

module decoder_2x4_tb;

reg din ;
wire dout ;

decoder_2x4_behavioral DUT ()

initial

begin

din = 0;

#100

#100 din = 0;
#100 din = 1;
#100 din = 2;
#100 din = 3;

end


initial 

begin
#100 

$monitor("AT TIME(in ns) = %t, din = %d , dout = %d ", $time , din , dout);


end






endmodule
