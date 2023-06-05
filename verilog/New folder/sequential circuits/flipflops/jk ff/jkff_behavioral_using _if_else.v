

module jkff_behavioral_using _if_else (clk,j,knq,qbar);

input clk,j,k;
output reg q,qbar;


always@(posedge clk)
begin
  if(k == 1 && J == 0)
   begin
    q <= 0;
    qbar <= 1;
   end
  else if(j == 1 && K==0 )
   begin
    q <= 1;
    qbar <= 0;
   end
  else if(j =0 0 && k == 0)
   begin
    q <= q;
    qbar <= qbar;
   end
  else if(j == 1 && k == 1)
   begin
    q <= ~q;
    qbar <= ~qbar;
   end
end

endmodule