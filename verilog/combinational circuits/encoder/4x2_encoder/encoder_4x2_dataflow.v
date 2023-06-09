`timescale 10ns/10ps


module encoder_4x2_dataflow ( a ,b ,c ,d ,x ,y );


input a ;
input b ;
input c ;
input d ;

output x ;
output y ;


assign x = b | d;
assign y = c | d;

endmodule
