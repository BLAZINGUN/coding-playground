module fifo_assertions(clock,resetn,ptr,enb,reg_);

sequence s1(enb,reg_);

enb && !reg_;

endsequence


sequence s2(ptr);

ptr == $past(ptr,1);

endsequence


property p1(clock,resetn,ptr,enb,reg_);
@(posedge clock)
disable iff(!resetn)

s1(enb,reg_) |=> s2(ptr);

endproperty


property p2(resetn,ptr);

@(posedge clock)

!resetn && !ptr

endproperty


wr_ptr_increment : assert property (p1(clock,resetn,ptr,enb,reg_);
wr_ptr_check     : assert property (p2(clock,resetn,ptr,enb,reg_);


endmodule
