`timescale 10ns/10ps

module ripple_carry_adder_tb;

reg[3:0] a,b;
reg cin;

wire [3:0] sum;
wire carry;
integer i;


ripple_carry_adder DUT (a,b,cin,sum,carry);

initial 
	begin
		a=0;
		b=0;
		cin=0;


		$monitor ( " a=%b, b=%b, cin=%b , sum=%b , carry =%b ", a, b, cin, sum, carry);  
    #10
      a    = 4'b1011;
    
      b    = 4'b0100;
    
      cin  = 1'b0;
      
      
         #10
         a    = 4'b1111;
       
         b    = 4'b1100;
       
         cin  = 1'b0;


     #10
      a    = 4'b1001;
    
      b    = 4'b0110;
    
      cin  = 1'b1;



      #10
      a    = 4'b1111;
    
      b    = 4'b1101;
    
      cin  = 1'b1;
      
        #10
         a    = 4'b1011;
       
         b    = 4'b1100;
       
         cin  = 1'b1;






	end    
endmodule
