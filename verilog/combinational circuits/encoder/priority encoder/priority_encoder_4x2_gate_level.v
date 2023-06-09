`timescale 10ns/10ps

module priority_encoder_4x2_gate_level (A0,A1,Y0,Y1,Y2,Y3);

input y0,y1,y2,y3;
output a0,a1;

wire y2bar; //not of y2 

wire and_out; // and of y2bar and y1

not(y2bar, y2);

and(and_out, y2bar, y1);

or(a1, y3,y2);
or(a0, and_out,y3);

endmodule