`timescale 1ns/1ns

module full_adder(a,b,carryin,sum,carryout);


input a,b,carryin;
output sum,carryout;


wire w1,w2,w3;


//gate-level

xor (sum,a,b,carryin);

and a1(w1,a,b);
and a2(w2,b,c);
and a3(w3,a,c);

or o1(carryout,w1,w2,w3);



//dataflow

assign sum = a^b^carryin;
assign carryout = (a&b)+(b&c)+(c&a); 


//behavioral
//similar to half adder
//refer half_adder.v





endmodule