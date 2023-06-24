//strength can be given to gates to resolve contention
//first value is the strength of 1 state in the output
//second value is the strength of 1 state in the output


//*************************************************************************************************************************************************

module strength (o,i1,i2);

input i1,i2;
output o;

buf (supply1 , pull0) g1 (o,i1) , g2(o,i2);

endmodule



//*************************************************************************************************************************************************



module strength2 (o,i1,i2);

input i1,i2;

ouput o;

buf (strong1,pull0) g1(o,i1);
buf (pull1,pull0) g2(o,i2);

endmodule