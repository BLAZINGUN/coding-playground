module armstrong_number;

int i;
int a,b; //input variables for functions
int j; //variable to count the order of the number
int ord,n,temp,sum = 0; //variables to calculate the sum 
int number = 153; // variable to check whether a number is an armstrong number

function int order(input int b); //order tells us how many digits it has
    begin
        while(b)
            begin
                j = j+1;
                b = b/10;
            end
        order = j;
    end
endfunction

function int armstrong(input int a);
    begin
        temp = a;
        ord = order(a); //first we calculate the order

        while(temp)
            begin
                n = temp%10;
                sum = sum + (n**ord); // then we calculate the sum based on order
                temp = temp/10;
            end

        if(sum == a)
            armstrong = 1'b1;
        else    
            armstrong = 1'b0;        
    end
endfunction

initial 
    begin
        i = armstrong(number);
        if(i)
            $display("the given number %0d is an armstrong number",number);
        else 
            $display("the given number %0d is not an armstrong number",number);       
    end

endmodule
