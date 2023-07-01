//these are used to resolve the contention when two signals are of same strengths 

//wand - when two signals are of same strength and driving a particular output then the output is the and of the two signals

//wor -   when two signals are of same strength and driving a particular output then the output is the or of the two signals


//triand and trior are similar to wand and wor

module wand1(i1,i2,o);

input i1,i2;
output o;

wand o;

buf (strong1,pull0) g1 (o,i1);
buf (pull1,pull0) g2 (o,i2);

endmodule



module wor1(i1,i2,o);

input i1,i2;
output o;

wor o;

buf (strong1,pull0) g1 (o,i1);
buf (pull1,pull0)   g2 (o,i2);

endmodule


//combining delays and strengths

wire (drive_strength_1 , drive_strength_0) # (delay_0_1 , delay_1_0 , turn_off_delay) signal1,signal2;

