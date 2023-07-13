module half_adder (a,b,clk,sum,carry);

input a,b,clk;
output reg sum,carry;


always @ (posedge clk)
    begin

        sum = a^b;
        carry = a&b;
    end

endmodule



module half_adder_tb();

reg a,b,clk;
wire sum,carry;

half_adder DUT (a,b,clk,sum,carry);

initial
    begin
        clk = 0;
        forever 
            begin
                #5 clk = ~clk;
            end
    end


property p1;
    @(posedge clk)
        (a== 1'b0 && b== 1'b0,disp) |->   (sum == 1'b0 && carry == 1'b0);
endproperty


property p2;
    @(posedge clk)
        (a== 1'b0 && b == 1'b1,disp) |->  (sum == 1'b1 && carry == 1'b0);  
endproperty


property p3;
    @(posedge clk)
        (a== 1'b1 && b == 1'b0,disp) |->  (sum == 1'b1 && carry == 1'b0);
endproperty


property p4;
    @(posedge clk)
        (a== 1'b1 && b == 1'b1,disp) |->   (sum == 1'b0 && carry == 1'b1);
endproperty

task disp;

$display("\t at time t = %t , a = %b , b = %b , sum = %b , carry = %b ", $time,a,b,sum,carry);

endtask

initial

    begin
        #10;
        {a,b} = 0;
        #10 {a,b} = 2'b01;
        #10 {a,b} = 2'b10;
        #10 {a,b} = 2'b11;
        #10 {a,b} = 2'b00;



        a1: assert property(p1)
                $display("assertion p1 passed");
            else
                $display("assertion p1 failed");

        b2: assert property(p2)
                $display("assertion p2 passed");
            else
                $display("assertion p2 failed");

        c3: assert property(p3)
                $display("assertion p3 passed");
            else
                $display("assertion p3 failed");

        d4: assert property(p4)
                $display("assertion p4 passed");
            else
                $display("assertion p4 failed");

    end

initial
    begin
        $monitor("the values of a = %b ,b = %b ,sum = %b ,carry = %b ," , a,b,sum,carry);
    end
endmodule