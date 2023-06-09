`timescale 10ns/10ps

module encoder_8x3_tb;

reg d0;
reg d1;
reg d2;
reg d3;
reg d4;
reg d5;
reg d6;
reg d7;


wire a;
wire b;
wire c;





encoder_8x3_behavioral_using_if_else DUT (d0,d1,d2,d3,d4,d5,d6,d7,a0,a1,a2);

initial

begin

$monitor ("at time = %t , d0 = %b , d1=%b, d2=%b, d3=%b, a0=%b, a1=%b ", $time , d0 , d1 , d2 , d3, a0, a1 )

d0 = 0;
d1 = 0;
d2 = 0;
d3 = 0;
d4 = 0;
d5 = 0;
d6 = 0;
d7 = 0;

#20

d0 = 0;
d1 = 0;
d2 = 0;
d3 = 1;
d4 = 0;
d5 = 0;
d6 = 0;
d7 = 0;


#20

d0 = 0;
d1 = 1;
d2 = 0;
d3 = 0;
d4 = 0;
d5 = 0;
d6 = 0;
d7 = 0;


#100 $finish

end

endmodule