`timescale 10ns/10ps

module mux_2x1_tb;

reg i0,i1,s;
wire y;


mux_2x1_dataflow DUT (i0,i1,s,y);

initial 
	begin
		i0=1;
		i1=0;
		s=0;
		#100 $finish;

	end

#10 s = 1;
#10 s = 0;

$monitor("AT TIME(in ns) = %t, i0 = %d ,i1 = %d, s = %d, y = %d", $time , i0 , i1 , s , y);

endmodule



