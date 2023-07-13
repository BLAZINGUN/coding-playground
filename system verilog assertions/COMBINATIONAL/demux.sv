module demux(in,sel,out);

input in,sel;
output [1:0] out;

always @(*) 

    begin
        if(sel)
            out[1] = in;
        else if(!sel)
            out[0] = in;
        else 
            out = 2'bxx;
    end



property p1;
    (!sel && (out[0] == in));
endproperty

property p2;
    (sel && (out[0] == in));
endproperty

initial 
    begin
        a1: assert property(p1)
            $display("out[0] is working fine");
        a2: assert property(p2)
            $display("out[1] is working fine"); 
    end

endmodule