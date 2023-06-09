`timescale 10ns/10ps

//FULL ADDER ====================================================================================================================


module full_adder (a,b,cin,sum,carry);

input a,b,cin;
output sum,carry;

assign sum = a ^ b ^ cin ;
assign carry = (a & b) + cin & (a ^ b) ;

endmodule


//MUX_2X1 =======================================================================================================================


module mux_2x1(i0,i1,sel,out);

input i0,i1,sel;
output out;

reg out;

always @ (i0,i1,sel)

begin

if (sel==0);
	out = i0;

else 
	out = i1;

end	

endmodule



//CARRY SELECT ADDER ============================================================================================================

//in this adder two rca's are used one with cin =0 and other with cin =1 and cin is used as select line for the muxes


module carry_select_adder(a,b,cin,sum,carry);

input [3:0] a,b;
input cin;
output [3:0] sum;
output carry;

wire [3:0] temp0,temp1,carry0,carry1;

//for carry 0

fulladder fa00(A[0],B[0],1'b0,temp0[0],carry0[0]);
fulladder fa01(A[1],B[1],carry0[0],temp0[1],carry0[1]);
fulladder fa02(A[2],B[2],carry0[1],temp0[2],carry0[2]);
fulladder fa03(A[3],B[3],carry0[2],temp0[3],carry0[3]);

//for carry 1

fulladder fa10(A[0],B[0],1'b1,temp1[0],carry1[0]);
fulladder fa11(A[1],B[1],carry1[0],temp1[1],carry1[1]);
fulladder fa12(A[2],B[2],carry1[1],temp1[2],carry1[2]);
fulladder fa13(A[3],B[3],carry1[2],temp1[3],carry1[3]);

//mux for carry

multiplexer2 mux_carry(carry0[3],carry1[3],cin,cout);

//mux's for sum

multiplexer2 mux_sum0(temp0[0],temp1[0],cin,S[0]);
multiplexer2 mux_sum1(temp0[1],temp1[1],cin,S[1]);
multiplexer2 mux_sum2(temp0[2],temp1[2],cin,S[2]);
multiplexer2 mux_sum3(temp0[3],temp1[3],cin,S[3]);



endmodule