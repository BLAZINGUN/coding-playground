module demux_1x2(in,en,sel,out);

input in,sel,en;

output [1:0]out;


//gate-level

and a1 (out[0],en,~sel,in);
and a2 (out[1],en,sel,in);


//dataflow

assign out[0] = en && ~sel && in;
assign out[1] = en && sel && in;


//behavioral

output reg [1:0] out;

always @(*)

    begin

        if (en)
            begin
                if(~sel)
                    out[0] = in;
                else if (sel)
                    out[1] = in;
                else
                    out = 2'bxx;
                end 
        else
            begin
                out = 2'bxx;
            end

    end

    