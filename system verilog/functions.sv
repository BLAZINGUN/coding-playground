module top;

int result;

int result1;
int result2;


int a = 5;
int b = 10;

function  int sum(input int var1,var2);

    $display("inside function");
    sum = var1 + var2;
    
    
endfunction

int c,d ;

//static and automatic functions

//static function
function int factorial_static(input int var3);
    if(var3 >= 2)
        result1 = var3 * factorial_static(var3-1);
    
    else 
        result1 = 1;

    return result1;

endfunction

//automatic function
function automatic int factorial_automatic(input int var3);
    if(var3 >= 2)
        result2 = var3 * factorial_static(var3-1);
    
    else 
        result2 = 1;

    return result2;

endfunction


        




initial 

    begin

    //Calling a function with values as arguments
    result = sum(2,3);
    $display("the value of result is %0d " , result);

    //Calling a function with variables as arguments
    result = sum(a,b);
    $display("the value of result is %0d " , result);

    //Calling a function with variables with names
    result = sum(.var1(3),.var2(8));
    $display("the value of result is %0d " , result);


    //static function
    result1 = factorial_static(5);

    //automatic function
    result2 = factorial_automatic(5);


    $display("factorial_static : %0d" , result1);
    $display("factorial_automatic : %0d" , result2);



    end

endmodule