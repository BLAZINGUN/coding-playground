`timescale 10ns/10ps

module bcd_ex3_dataflow(
    input a,
    input b,
    input c,
    input d,
    output w,
    output x,
    output y,
    output z
    );

reg w,x,y,z;

always @ (a,b,c,d)

begin

assign w = (a | (b & c) | (b & d));
assign x = (((~b) & c) | ((~b) & d) | (b & (~c) & (~d)));
assign y = ((c & d) | ((~c) & (~d)));
assign z = ~d;


end

endmodule