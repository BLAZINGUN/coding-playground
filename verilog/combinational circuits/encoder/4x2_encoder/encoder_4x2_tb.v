`timescale 10ns/10ps

module encoder_4x2_tb;

reg d0,d1,d2,d3;
wire a0,a1;

encoder_4x2_gate_level  DUT (d0,d1,d2,d3,a0,a1);

initial

begin

 $monitor ("at time = %t , d0 = %b , d1=%b, d2=%b, d3=%b, a0=%b, a1=%b ", $time , d0 , d1 , d2 , d3, a0, a1 )

 d0 = 1;d1 = 0;d2 = 0;d3 = 0;

 #10;

 #10; d0 = 0;d1 = 1;d2 = 0;d3 = 0;
 #10; d0 = 0;d1 = 0;d2 = 1;d3 = 0;
 #10; d0 = 0;d1 = 0;d2 = 0;d3 = 1;

 #20 $finish

end

endmodule