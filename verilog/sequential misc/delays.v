module testing (a,b,c,clk,reset,d,e,f);

input [2:0]a,b,c;
input clk,reset;
output [2:0]d,e,f;

assign #10 d = a;
assign #20 e = #5 b;
assign #30 f = #15 c;

always@(posedge clk)
    begin
         #10 d <= a;
         #20 e <= #5 b;
         #30 f <= #15 c;
    end

always@(posedge clk)
    begin
        if(reset)
            {d,e,f} <= 0; 
    end

endmodule


module testing_tb;

reg a,b,c,clk,reset;
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
    begin
        @(posedge clk);
        reset = 1'b1;
        @(posedge clk);
        reset = 1'b0;
    end
endtask


initial 
    begin
        reset_task;
        $monitor(" at time = %t , the values of a  = %b , b = %b , c = %b , d = %b , e = %b , f = %b" , $time,a,b,c,d,e,f);
        #10 a = 4; b = 5; c = 6;
    end

endmodule
