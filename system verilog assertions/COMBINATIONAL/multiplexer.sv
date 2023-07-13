module mux_2x1(in,sel,out);

input [1:0] in;
input sel;
output reg out;

always @(*)
    begin
        out = sel?i[1]:i[0];
    end

property p1;

sel && (out == in[1]);

endproperty

property p1;

(!sel) && (out == in[0]);

endproperty


initial 
    begin
        a1: assert property(p1)
                $display("in[1] working correctly");
            else
                $display("in[1] not working correctly");
        
        b1: assert property(p2)
                $display("in[0] working correctly");
            else
                $display("in[0] not working correctly");
    end

endmodule