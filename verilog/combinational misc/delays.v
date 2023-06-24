//****************************************************  NET DELAY  *******************************************************************************

module net_delay(x,y);

input x;
output y;

wire #2 nn;
//here since only one value is specified as delay , the rise delay and fall delay are equal to 2.


not(nn,x);
buf y=x;

endmodule



module net_delay(x,y);

input x;
output y;

wire #(2,1) nn;
//here the first value is the rise delay(0 to 1) = 2 , and the fall delay(1 to 0) is = 1. 


not(nn,x);
buf y=nn;

endmodule

//***********************************************************************************************************************************************




//*****************************************************GATE DELAY  *******************************************************************************

//equal rise and fall delay

module gate_delay(a,b,c,d,e,f);

input a,b,c,d;

output e,f;

or #2 o1 (e,a,b);

and #3 a1 (f,c,d);

endmodule




//unequal rise and fall delay
// rise delay is 2
// fall delay is 1

module gate_delay(a,b,c,d,e,f);

input a,b,c,d;

output e,f;

or #(2,1) o1 (e,a,b);

and #(3,2) a1 (f,c,d);

endmodule




//***********************************************************************************************************************************************






//*****************************************************DELAYS WITH TRI-STATE GATES*********************************************************************************


bufif1 #(1,2,3) (out,in,control);

//first one is delay of  (0 to 1) transition of out 

//second one is delay of (1 to 0) transition of out

//third one is delay of  (out to z) transition of out as control goes from 1 to 0

//***********************************************************************************************************************************************





//*****************************************************TYPES OF DELAYS*********************************************************************************

// for every delay there are ranges
// they are MINIMUM , TYPICAL , MAXIMUM
// these are represented as MINIMUM:TYPICAL:MAXIMUM


module and_gate(a,b,c);

input b,c,in,control;
output a,out;


and #(1:2:3 , 2:4:6) a1 (a,b,c);



bufif1 #(1:5:9 , 2:6:8 , 3:4:7) (out,in,control);

endmodule




//***********************************************************************************************************************************************
module net_delay_tb();

reg x;
wire y;

net_delay dut (x,y);

initial
	begin
		x = 1'b0;
		#6 x = ~x;
		#6 x = ~x;
	end

#20 $finsih;

endmodule


//***********************************************************************************************************************************************