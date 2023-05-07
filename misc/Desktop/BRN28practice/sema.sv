module top;
semaphore sema;
task write();
sema.get(1);
$display("Iam starting write");
#5;
$display("Iam ending write%t",$time);
sema.put(1);
endtask

task read();
sema.get(1);
$display("Iam starting read");
#5;
$display("Iam ending read%t",$time);
sema.put(1);
endtask
initial 
	begin
	sema=new(2);
	fork
		write();
		read();
	join
end

endmodule
