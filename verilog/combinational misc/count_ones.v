module count_ones.v(p,a,en);

input [7:0]a;
input en;

output reg p;

always @ (posedge en)
	begin
		
		p = nn(a) % 2;

		$display(" t = %0d , a = %0b , en = %0b , p = %0b" , $time,a,en,p);

	end


function integer  nn;

input [7:0] a;
integer i;

begin
	for (i=0;i<8;i=i+1)
		begin

			if(i==0)
				nn=0
			if(a[i])
				nn=nn+1;

		end
end

endfunction



endmodule