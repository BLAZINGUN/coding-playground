module nearest;

int number = 73;
int rem,result;

initial 

    begin
        rem = number%5;
        case(rem)
            0: result = number;
            1: result = number - rem;
            2: result = number - rem;
            3: result = number + rem-1;
            4: result = number + rem-2;
        endcase
        $display("the nearest multiple of 5 of the given number %0d is %0d",number,result);
    end

endmodule