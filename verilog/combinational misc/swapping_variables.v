module top(a,b,c,d);

input [2:0] a,b;
output reg [2:0] c,d;

reg [2:0]e,f;

always @ (*)
    begin
        e = a;
        f = b;

        if(e>f)
            begin
                e = e+f;
                f = e-f;
                e = e-f;
            end
        else
            begin
                e = e+f;
                f = f-e;
                e = f-e;
            end

        c = e;
        d = f;
    end

endmodule





module top_tb;

reg [2:0] a,b;
wire [2:0] c,d;


top dut (a,b,c,d);

initial 
    
    begin

        $monitor($time,"a = %d,b = %d,c = %d,d = %d,",a,b,c,d);

        #10 {a,b} = 0;
        #10 a = 5; b = 3;
        #10 a = 5; b = 3;

    end

endmodule