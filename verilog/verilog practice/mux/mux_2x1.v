`timescale 1ns/1ns

module mux_2x1(in,sel,en,out,);

input [1:0] in;
input sel,en;
output out;

wire w1,w2;

wire w3 = ~sel;
//gate-level

and a1(w1,in[0],en,w3);
and a2(w2,in[1],en,sel);

or o1 (out,w1,w2);


//dataflow

assign out = (en&in[0]&w3) + (en&in[1]&sel);

//another way

assign out = (en) ?((sel)?in[1] :in[0]) : (1'bx);



//behavioral
//output reg out;
always @(*)
    begin
        
        if (en)
            begin
                    case(sel)
                        1'b0 : out = in[0];
                        1'b1 : out = in[1];
                        default : out = 1'bx;
                    endcase
            end
        
        else 
            out = 1'bx;


    end



//using if else 

always @ (*)
    begin
        
        if(en && ~sel)
            out = in[0];
            
        else if(en && sel)
            out = in[1];

        else
            out = 1'bx;
   
    end    

