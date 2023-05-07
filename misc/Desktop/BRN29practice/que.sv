module top;
	int qm1[$]={1,3,5,7,9};//5 
	int k=2;
	int s[$]={1,56,789};

initial 
	begin
	qm1.insert(1,k);//6
	$display("%p",qm1);	
	qm1.delete(5);
	$display("%p",qm1);
	qm1.push_front(7);	
	$display("%p",qm1);
	qm1.push_back(9);	
	$display("%p",qm1);
	k=qm1.pop_front();
	$display("%p",qm1);
	$display("%d",k);
	k=qm1.pop_back();
	$display("%p",qm1);
	//s=qm1.min();
	//$display("The min is %p",s);
	qm1={qm1,s};
	$display("%p",qm1);



	end


endmodule
