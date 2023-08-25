
module top;

int q1[$] = {1,2,3,4};
int popped_variable;
int count1 = $size(q1);
int q2[$];
int count2 = 0;

initial
    begin
        $display("original queue : %p",q1);
        popped_variable = q1[count1-1];
        count1 = $size(q1);

        for (int j = 0; j< count1-2; j++)
            begin
                q2[j] = 0;
            end

        for(int i = 0; i<count1-1 ; i++)
            begin
                q2[i] = q1[count2];
                count2++;
            end

        q1 = q2;
        $display("popped_variable : %0d", popped_variable);
        $display("updated queue : %p",q1);
    end

endmodule
