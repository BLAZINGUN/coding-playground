module top;


class bank;

int balance;

function int summary;

    return balance;

endfunction




endmodule



module top;

class random;

randc logic a; 
string x,z;
constraint a1 {a inside {0,1,x,z};}

endclass

random r1;

initial 

    begin

        r1 = new();
        repeat(4)
        assert(r1.randomize());
        $display("the value of a is : %d" , r1.a);
    end


endmodule



module 






module top;

initial 

    begin
     
        $display("0,1,x,z");

    end

endmodule