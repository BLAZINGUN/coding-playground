module parity_check(a,en,chk);


input [7:0] a;
input en;

output reg chk;

always @ (posedge en)

	begin

		chk = pc(a);
		$display  ("at time t = %t , a = %b , en = %b , pc  = %b" , $time,a,en,chk);

	end


function pc;
begin
	
	input [7:0]a;
	pc = ^a;
	
end
endfunction



endmodule
`