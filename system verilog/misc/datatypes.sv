
module top;

class ex;


//***********************************************************************************4-state datatypes***************************************************************************************

//wire and reg are structural data types since they are used in hardware connections
/*
 logic  w1;
 reg rg1;




//integer data type

rand integer  i1;



//real data type

rand real r1;
// real variables cannot be randomized




//time data type

rand time t1;



//parameters

parameter p1 = 20;


//logic
randc logic rl1;




//*******************************************************************************2-state datatypes(unsigned)******************************************************************************


//bit

rand bit b1;


//byte

rand byte unsigned  by1;


//shortint

rand shortint unsigned si1;





//int

rand int unsigned ius1;



//longint

rand longint unsigned li1;





//***********************************************************************************2-state datatypes(signed)******************************************************************************



//byte

rand byte by2;


//shortint

rand shortint si2;

*/

//int

rand int i2;


/*

//longint

rand longint li2;

//*******************************************************************************************************************************************************************************************


//string

rand string s1;


//typedef


//event

event e1;
*/



endclass



ex e1;

initial
        begin

                e1 = new();
                repeat(20)
                        begin
                                assert(e1.randomize());
                                $display ("%p",e1.si2);

                        end


        end





endmodule

