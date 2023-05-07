module top;

int q1[$];
int q2[$];
bit q4 [$];
string q5[$] = {"red","green","blue"};

//bounded queue
int q3[$:10];

int variable_to_store_popped_values;



initial 

    begin

        //unbounded queue
        q1 = '{2,5,7};
        q2 = '{4,9};
        
        q3 = {1,5,7,9};

        $display("the contents of q3 is : %p",q3);

        $display("the contents of q1 is : %p",q1);

        //indexing starts from 0
        //queue methods

        q1.insert(1,5);
        $display("the contents of q1 is : %p",q1);

        q1.delete(2);
        $display("the contents of q1 is : %p",q1);

        q1.push_front(8);
        $display("the contents of q1 is : %p",q1);

        q1.push_back(20);
        $display("the contents of q1 is : %p",q1);

        variable_to_store_popped_values = q1.pop_front();
        $display("the contents of q1 is : %p and the variable_to_store_popped_values is : ",q1,variable_to_store_popped_values);

        variable_to_store_popped_values = q1.pop_back();
        $display("the contents of q1 is : %p and the variable_to_store_popped_values is : ",q1,variable_to_store_popped_values);

        q2.delete();
        $display("the contents of q1 is : %p",q1);


        //array ordering methods
        q1.reverse();
        $display("the contents of q1 is : %p",q1);

        q1.sort();
        $display("the contents of q1 is : %p",q1);

        q1.rsort();
        $display("the contents of q1 is : %p",q1);

        q1.shuffle();
        $display("the contents of q1 is : %p",q1);


    end


endmodule