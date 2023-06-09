//comment other parts using multiline comments while working on one modelling style

`timescale 1ns/1ns

module half_adder(a,b,sum,carry);

input a,b;
output sum,carry;



//gate-level
xor x1 (sum,a,b);
and a1 (carry,a,b);



//dataflow
assign sum   = a^b;
assign carry = a&b;



//behavioral
input a,b;
output reg sum,carry;

always @ (*)
    begin
        
        sum   = a^b;
        carry = a&b;

    end


//behavioral using case

always @ (*)
    begin
        
        case({a,b})

        2'b00   : {sum,carry} = 2'b00;
        2'b01   : {sum,carry} = 2'b10;
        2'b10   : {sum,carry} = 2'b10;
        2'b11   : {sum,carry} = 2'b01;
        default : {sum,carry} = 2'bxx;
    
        endcase


    end


//behavioral using if else

always @ (*)
    begin
        
        if({a,b} == 2'b00)
            begin
                {sum,carry} = 2'b00;
            end

        else if ({a,b} == 2'b01)
            begin
                {sum,carry} = 2'b10;
            end
        
        else if ({a,b} == 2'b10) 
            begin
                {sum,carry} = 2'b10;
            end

        else if ({a,b} == 2'b11)
            begin
                {sum,carry} = 2'b01;
            end

        else 
            begin
                {sum,carry} = 2'bxx;
            end

    end


//another way of if else



always @(*)
    begin
        
        if ( (a == 1'b0) && (b == 1'b0))
            begin
                sum = 1'b0;
                carry = 1'b0;
            end
            
        else if ( (a == 1'b0) && (b == 1'b1))
            begin
                sum = 1'b1;
                carry = 1'b0;
            end

        else if ((a == 1'b1) && (b == 1'b0))
            begin
                sum = 1'b1;
                carry = 1'b0;
            end
        
        else if ((a == 1'b1) && (b == 1'b1))
            begin
                sum = 1'b0;
                carry = 1'b1;
            end

        else 
            begin
                sum = 1'bx;
                carry 1'bx;
            end
    end

endmodule
