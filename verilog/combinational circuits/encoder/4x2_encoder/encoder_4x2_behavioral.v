
`timescale 10ns/10ps


module encoder_4x2 ( a ,b ,c ,d ,x ,y );


input a ;
input b ;
input c ;
input d ;

output x ;
output y ;

reg x,y;

always @ (*)

begin

 x = b | d;
 y = c | d;

end

endmodule
