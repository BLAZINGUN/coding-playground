`timescale 10ns/10ps

module priority_encoder_4x2_tb;

 //Reg and Wire declarations

 reg [3:0] y;
 wire [1:0] a;
 
 // Instantiate the Unit Under Test (UUT)

priority_encoder_4x2_behavioral DUT (A,Y);

initial 

begin

 // Initialize Inputs
 Y = 0;
 // Wait 100 ns for global reset to finish
 #100;        
// apply test vectors

 #10 Y = 4'b0000;
 #10 Y = 4'b1000;
 #10 Y = 4'b0100;
 #10 Y = 4'b0010;
 #10 Y = 4'b0001;
 #10 Y = 4'b1010;
 #10 Y = 4'b1111;

end 


initial 

begin

$monitor("AT TIME(in ns) = %t, A = %b , Y = %b ", $time , A ,Y);

end    

endmodule