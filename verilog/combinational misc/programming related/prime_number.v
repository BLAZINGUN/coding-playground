module prime_number;

int in = 17;
int out;

initial
    begin
        if(in == 2)
            begin
                out = 1;
            end

        else if(in>2)
            begin
                out = 1;
                for (int i=2 ; i<in; i++)
                    begin
                        if(in%i == 0)
                            out = 0;
                    end
            end

        if(out == 1)
            $display("the given number %0d is a prime number",in);
        else
            $display("the given number %0d is not a prime number",in);
    end
endmodule
