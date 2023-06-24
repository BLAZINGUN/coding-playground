//net charges 

//when a net is driven by a signal , it takes the value of the sigal
//when the signal is tri-stated , the net too gets tri-stated.
//in practice the net can have a capacitor , which can store the signal level even after the source dries up
//such nets are declared with the keyword "trireg"


/*Driven state : when driven by a source or multiple sources, the net assumes the strength of the source

capacitive state : when the diving source is tri-stated, the net retains the last value it was in.

when in capacitive state , a net can have three storage strengths - large , medium and small
*/


module charge (out,in,control);

output out;
trireg (medium) out;

input in,control;

bufif1(out,in,control);


endmodule