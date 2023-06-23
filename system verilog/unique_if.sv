//system verilog introduced the following if-else constructs for violation checks
//unique-if
//unique0-if
//priority-if

/* unique-if

*it evaluates conditions in any order and does the following

* report an error when none of the if conditions match unless there is an explicit "else"
*report an error when there is more than 1 conditions matching


*/


/*unique0-if

*this doesnt report a violation if none of the conditions match  

*/

/*priority-if

*evaluates all the conditions in sequential order and a violation is reported when
*none of the conditions are true or if there is no else clause to the final if construct
    
*/


//example without else block for unique-if

module tb;


    int x = 4;

    initial
        begin

            unique if (x == 3)
                $display("x is %0d",x);
            
            else if (x ==5)
                $display("x is %0d",x);

            else
                $display("x is neither 3 nor 5");

            // the above code wont generate error

            unique if(x ==3)
                $display("x is %0d",x);
            else if (x ==5)
                $display("x is %0d",x);

            // the above code will give error because no else block
        end



endmodule





//code with multiple matching conditions will also give error

module tb;
    int x =4;

    initial 
        begin
            unique if(x ==4)
                $display("1. x is %0d",x);
            else if (x ==4)
                $display("2. x is %0d",x);
            else 
                $display(" x is not 4");
        end
endmodule



//priority if works similar to unique if but it follows sequential order of checking


