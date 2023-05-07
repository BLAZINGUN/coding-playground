module top;
	int cnt;
	int da[]={1,2,3,4,5};
	initial
		begin
			//cnt=da.sum with (int'(item>3)?item:1) ;
			cnt=da.product with(item>3?item:1);//1,1,1,4,5
			$display(cnt);
		end

endmodule


interface intf(input int a);



endinterface

module dff(intf
