`timescale 10ns/10ps
module carry_save_adder_tb;


reg[3:0] a,b;
reg cin;

wire [3:0] sum;
wire carry;


carry_save_adder DUT (a,b,cin,sum,carry);

initial 
	begin
		a=0;
		b=0;
		cin=0;


		$monitor ("a=%b, b=%b, c_in=%b c_out=%B, sum=%b", a, b, cin, carry, sum);  

		for (i = 0; i < 5; i = i+1)
			begin  
		     #10 a    = {$random}%16;  
		         b    = {$random}%16;  
		         c_in = {$random}%2;  
		    end     

	end    
endmodule