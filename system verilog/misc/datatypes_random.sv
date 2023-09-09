module top ;

// 2 state datatypes
//these can take only 1 or 0,  x or z states  are converted to 0 by default



class random_variables;

    randc bit clk;             //1bit clk unsigned
    randc bit [2:0] address;   //3 bit address
    randc bit unsigned [2:0] data; 

    rand byte ab;

    constraint c1 { ab == $random%10 ;}

function  void pre_randomize();

            $display("**************************************************************");
            $display("the value of clk before randomizing is %0d ",clk);
            $display("the value of address before randomizing is %0d ",address);
            $display("the value of data before randomizing is %0d ",data);
             $display("the value of ab before randomizing is %0d ",ab);
            $display("**************************************************************");
endfunction



function  void post_randomize();
    
            $display("the value of clk after randomizing is %0d ",clk);
            $display("the value of address after randomizing is %0d ",address);
            $display("the value of data after randomizing is %0d ",data);
            $display("the value of ab after randomizing is %0d ",ab);
            $display("**************************************************************");
endfunction

endclass


random_variables rv;





initial 

    begin

        rv  = new();

        repeat(20)
            assert (rv.randomize());

    end
endmodule