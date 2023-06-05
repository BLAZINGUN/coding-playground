module tb;


always @ (clear or preset)

begin
    if (clear)
        assign q =0;
    else if (preset)
        assign q = 1;
    else
        deassign q;
end 


always @(posedge clk)
    q <= d;
    

endmodule 