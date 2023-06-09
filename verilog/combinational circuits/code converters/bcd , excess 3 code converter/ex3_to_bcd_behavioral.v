`timescale 10ns/10ps

module ex3_to_bcd_behavioral (
    input w,
    input x,
    input y,
    input z,
    output a,
    output b,
    output c,
    output d
    );


reg a,b,c,d

always @ (w,x,y,z)

begin

assign a = ((w & x) | (w & y & z));
assign b = (((~x) & (~y)) | ((~x) & (~z)) | (x & y & z));
assign c = (((~y) & z) | (y & (~z)));
assign d = ~z;


end

endmodule