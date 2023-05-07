/*module top;
int a;
real r_num;
initial
 begin
//a=8.4; //implicit casting 
//r_num=9.8;
a=int'(9.8);//Explicit Casting$display("The value of a is %0d",a);
$display(a);
r_num=real'(a);
$display(r_num);
$display(a);
$cast(a,10.6);
$display(a);
end
endmodule*/
module top;
typedef enum{init,read,write,brd=5,bwr} fsm_state_e;
fsm_state_e state;
int c;
initial
begin
	state=read;
$display("The state name is %s the state value is %d",state.name,state );
c=state;
$display(c);
state=fsm_state_e'(2);//static casting	
$display("The state name is %s the state value is %d",state.name,state );
//state=fsm_state_e'(5);//static casting	
$display("The state name is %s the state value is %d",state.name,state );
//$cast(state,4);
//$display("The state name is %s the state value is %d",state.name,state );
$cast(state,7);
$display("The state name is %s the state value is %d",state.name,state );
end
endmodule






























