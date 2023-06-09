module sipo(clk,reset,in,out);

input clk,reset,in;

output reg [3:0]out;

reg q1,q2,q3,q4;


always@(posedge clk)
begin
    if (reset)
        {q1,q2,q3,out} <= 0;
    
    else 
        
        begin
            q1 <= in;
            q2 <= q1;
            q3 <= q2;
            q4 <= q3;
            out[3] <= q4;
            out[2] <= q3;
            out[1] <= q2;
            out[0] <= q1; 
        end
end

endmodule

