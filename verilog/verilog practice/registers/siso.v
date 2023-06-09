module siso_4bit(clk,reset,in,out);

input clk,reset,in;

output out;


wire q1,q2,q3;

always@(posedge clk)
    begin
        if (reset)
            {q1,q2,q3,out} <= 0;
        
        else 
            
            begin
                q1 <= in;
                q2 <= q1;
                q3 <= q2;
                out <= q3;
            end
    end


endmodule
