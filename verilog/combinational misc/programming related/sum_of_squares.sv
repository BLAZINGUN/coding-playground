module sum_of_squares;

int number = 5;
int temp,result;

function int sum(input int a);
    for (int i=1; i<=number; i++)
        temp = temp + (i**2);
    
    sum = temp;
endfunction

initial 
    begin
        result = sum(number);
        $display("The sum of squares of first %0d natural numbers is %0d", number,result);
    end
endmodule


The sum of squares of first 5 natural numbers is 55