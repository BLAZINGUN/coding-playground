module factorial_of_a_number;

int number = 5;
int result;

function automatic int factorial(input int a);
    if (a = 1)
        factorial = 1;
    else if(a>1)
        factorial = a*factorial(a-1);
endfunction

initial 
    begin
        result = factorial(number);
        $display("The factorial of the given number %0d is %0d",number,result);
    end

endmodule