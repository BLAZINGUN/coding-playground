
module top;

int q1[$] = {2,3,4};
int q2[$];

int a = 1; //variable to be pushed
int count1 = $size(q1);
int count2 = 1;

initial
        begin

            $display("original queue : %p",q1);

            q1[count1] = a;

            for (int i=0; i<count1+1;i++)
                begin
                    q2[i] = 0;
                end

            q2[0] = a;

            for(int j = 0; j <count1; j++)
                begin
                    q2[count2] = q1[j];
                    count2++;
                end

            q1 = q2;


            $display("updated queue : %p",q1);

        end

endmodule
