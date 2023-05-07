module top ;

// 2 state datatypes
//these can take only 1 or 0,  x or z states  are converted to 0 by default

bit clk;             //1bit clk unsigned
bit [2:0] address;   //3 bit address
bit unsigned [2:0] data; 

initial 

    begin
        address = -5; //negative numbers are printed in 2's complement form
        clk = 1;
        data = 7;
    

$display("the value of clk is %0b ",clk);
$display("the value of address is %0b ",address);
$display("the value of data is %0b ",data);
    

    end
endmodule