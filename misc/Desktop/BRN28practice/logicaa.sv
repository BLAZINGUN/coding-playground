/* module logic_test(input wire y);

endmodule

module top;

logic c_out;
logic_test LT(c_out);

endmodule */

module top;
integer c;
real b;
initial 
begin
//b=13.4;
//c=14;
//c=$rtoi(12.76);
c=int'(12.76);

$display(c);
end
endmodule
