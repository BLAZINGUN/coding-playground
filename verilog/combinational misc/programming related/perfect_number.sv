module perfect_number;

int number = 6;
int sum;

initial 
    begin
        if (number == 1)
            $display("the given number %0d is a perfect number",number);

        else if(number>1)
            begin
                for(int i=1;i<number;i++)
                    begin
                        if(number%i == 0)
                            sum = sum+i;
                    end

                if(number == sum)
                    $display("the given number %0d is a perfect number",number);
                else
                    $display("the given number %0d is a not perfect number",number);
            end
    end

endmodule