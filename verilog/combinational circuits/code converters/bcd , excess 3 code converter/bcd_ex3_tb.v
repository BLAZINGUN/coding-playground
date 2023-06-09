`timescale 10ns/10ps

module bcd_ex3_tb;

reg a,b,c,d;
wire w,x,y,z;

bcd_ex3_dataflow DUT (a,b,c,d,w,x,y,z)

initial 
begin
a=0;
b=0;
c=0;
d=0;
#100
$monitor ("at time (in ns) = %t , a = %d ,b = %d ,c = %d ,d = %d ,w = %d ,x = %d ,y = %d ,z = %d " , $time,a,b,c,d,w,x,y,z)
end


initial 
begin
#100

#10 a = 1;
#10 b = 1;
#10 c = 0;
#10 d = 1;
#10 a = 0;
#10 b = 0;
#10 c = 1;
#10 d = 1;

end

endmodule
