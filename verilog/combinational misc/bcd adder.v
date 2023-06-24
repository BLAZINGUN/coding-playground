module bcd_adder(a,b,c,sum,carry);

input [3:0] a,b;
input c;

output reg [3:0] sum;
output reg carry;


reg [4:0] sum_temp;

always@(a,b,c)
	begin
		
		sum_temp = a+b+c;

		if(sum_temp>9)
			begin
				sum_temp = sum_temp + 6;
				carry = 1;
				sum = sum_temp[3:0];
			end
		else
			begin
				carry = 0;
				sum = sum_temp[3:0];
			end


	end


endmodule



module bcd_adder_tb;

reg [3:0] a,b;
reg c;

wire [3:0] sum;
wire carry;

bcd_adder dut (a,b,c,sum,carry);

initial
begin
	
{a,b,c} = 0;

end


initial
	begin

	a = 2; b = 3; c = 1; #10;
	a = 7; b = 5; c = 2; #10;
	a = 3; b = 4; c = 1; #10;
	a = 6; b = 5; c = 2; #10;
	a = 7; b = 1; c = 1; #10;
	a = 8; b = 9; c = 2; #10;

	end


endmodule




