`timescale 10ns / 10ps

module sr_latch(
    input S,
    input R,
    output Q,
    output Qn
    );
 
wire Q_int, Qn_int;
 
assign  Q_int = ~(S & Qn_int);
assign  Qn_int = ~(R & Q_int);
assign  Q = Q_int;
assign  Qn = Qn_int;
 
endmodule