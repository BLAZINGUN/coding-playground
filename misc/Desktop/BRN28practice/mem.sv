//packed Arrays
/*module top;
bit[3:0][7:0] byte_packed;//4 parts ...each part has 8 bits
initial 
	begin
		byte_packed=32'h5454____5479;
		$displayh(byte_packed);
		$displayh(byte_packed[0]);
		$displayh(byte_packed[0][0]);
	end

endmodule*/
//Unpacked arrays
/*module top;
int a[4:0];//5 loacation
initial 
	begin
		for(int i=0;i<5;i++)
		begin
			a[i]=(i+1)*2;//a[0]=2,
		end
$display("%p",a);
	
	end
endmodule*/

module top;
int a[4:0];//5 loacation
initial 
	begin
		foreach(a[i])
			$display(i);
			//a[i]=i*2;
		$display("%p",a);
	
	end
endmodule
