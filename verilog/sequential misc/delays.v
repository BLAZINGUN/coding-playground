module testing (a,b,c,clk,reset,d,e,f);

input [2:0]a,b,c;
input clk,reset;
output [2:0]d,e,f;

assign #10d = a;
assign #20e = #5b;
assign #30f = #15c;

always@(posedge clk)
    begin
         #10d <= a;
         #20e <= #5b;
         #30f <= #15c;
    end

always@(posedge clk)
    begin
        if(reset)
            {d,e,f} <= 0; 
    end

endmodule


module testing_tb;

reg a,b,c,clk;
wire d,e,f;


testing DUT (a,b,c,clk,reset,d,e,f);

initial 
    begin
        {a,b,c,clk} = 0;       
    end


initial
    begin
        clk = 0;
        #2 clk = ~clk;
    end


task reset_task;
    @(posedge clk)
    reset = 1'b1;
    @(posedge clk)
    reset = 1'b0;
endtask


initial 
    begin
        reset_task;
        $monitor(" at time = %t , the values of a  = %b , b = %b , c = %b , d = %b , e = %b , f = %b" , $time,a,b,c,d,e,f);
        #10 a = 4; b = 5; c = 6;
    end

endmodule
