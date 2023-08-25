module top;

int q1[$] = {1,2,3};

int a = 4; //variable to be pushed


int count1 = $size(q1);

initial
        begin

            $display("original queue : %p",q1);

            q1[count1] = a;

            $display("updated queue : %p",q1);

        end

endmodule
