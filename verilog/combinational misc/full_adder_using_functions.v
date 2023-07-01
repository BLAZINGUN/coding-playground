module full_adder(r,p,q,en);

input [1:0] p,q;
input en;

output reg [2:0] r;

reg[2:0] c;


integer i;

always @(posedge en)

	begin
			for (i=0;i<2;i=i+1)
				begin

					if(i==0)
						c[i] = 1'b0;
					{c[i+1b1],r[i]} = fa(p[i],q[i],c[i]);

				end


				r[2] = c[2];
				$display( "t=%0d, en = %b, p = %b, q = %b, r = %b",$time,en,p,q,r);

	end




function [1:0] ha;
begin

input a,b;
	
	ha = {a&b,a^b};

end 
endfunction



function [1:0] fa;

input a,b,c;
reg [1:0] a1,a2,aa2;

begin
	
	a1 = ha(a,b);
	aa2 = ha(a1[0],c);

	a2[1] = (aa2[1]|a1[1]);
	a2[0] = aa2[0];
	fa = a2;

end
endfunction




endmodule