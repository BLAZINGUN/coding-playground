module top();
	mailbox #(int) mb;
	task processA();
	mb.put(1);
	mb.put(2);
	mb.put(4);
	endtask

	task processB();
	int a;
	mb.get(a);
$display(a);
	mb.get(a);
$display(a);
	mb.get(a);
$display(a);
	endtask
initial 
begin
mb=new(3);
fork
processA();
processB();

 join

end


endmodule
