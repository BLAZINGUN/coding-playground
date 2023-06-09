`timescale 1ns/1ns

module half_adder_tb();

//reg inputs and wire outputs
reg a,b;
wire sum,carry;

//instantiate dut
half_adder DUT (a,b,sum,carry);


//initialize inputs to zero
initial 
    begin
        a = 1'b0;
        b = 1'b0;
    end

//another way

/* initial
        begin
            {a,b} = 0;
        end  
*/

//task for driving inputs
task input_to_dut (input a,b);

begin
    a = a;
    b = b;
end

endtask


initial 
    begin
        
        #10;
        input_to_dut(0,0);
        #10;
        input_to_dut(0,1);
        #10;
        input_to_dut(1,0);
        #10
        input_to_dut(1,1);

        #100 
        $finish;
    end

//another way of stimulus
/* instead of task use this 
    initial
        begin
        #10; a = 1'b0; b = 1'b0;
        #10; a = 1'b0; b = 1'b1;
        #10; a = 1'b1; b = 1'b0;
        #10; a = 1'b1; b = 1'b1;
        
        #100; $finish;
        end
    */

/*another way 

    initial 
        begin
            #10; {a,b} = 2'b00;
            #10; {a,b} = 2'b01;
            #10; {a,b} = 2'b10;
            #10; {a,b} = 2'b11;
        end

*/


/*another way
    initial
        begin
            for (integer i = 0; i<4; i = i + 1)
                begin
                    {a,b} = i;
                end
        end

/*another way
        initial
            begin
                for (integer i = 0; i<4; i = i+1 )
                    begin
                        case(i)
                          0 : {a,b} = 2'b00;
                          1 : {a,b} = 2'b01;
                          2 : {a,b} = 2'b10;
                          3 : {a,b} = 2'b11;
                        endcase
                    end
                end


/*another way 
        always 
                begin
                    #10 a = ~c;
                    #20 b = ~b;
                    #40 c = ~a;
                end
*/


//monitor statement
always @(*) 
    begin
        $monitor("at time = %t , a = %0d , b = %0d , sum = %0d , carry = %0d" , $timeformat(-9,1,"ns",4) ,a,b,sum,carry);        
    end

endmodule

