/*module top;

	bit[3:0][7:0] byte_packed;//4 slots each slot contains 8 bits
	initial
		begin
			byte_packed=32'h5_4_5_4_5432;
		$displayh(byte_packed);
		$displayh(byte_packed[0]);
		$displayh(byte_packed[0][0]);
			
		end


endmodule*/
/*module top;

	bit[3:0][7:0] bytes[0:2];//(4 slots each slot contains 8 bits) 3 rows
	initial
		begin
		bytes[0]=32'd255;
		$display(bytes[0]);
		bytes[0][3]=8'd255;
		$displayh(bytes[0]);
		
		bytes[0][0][0]=1'b0;
		$displayh(bytes[0]);
	
		end


endmodule*/
/*module top;
	logic [31:0] msrc[5], mdst[5];
	initial 
	begin
		for(int i=0;i<$size(msrc);i++)
			msrc[i]=i;
		foreach(mdst[j])
			mdst[j]=msrc[j]*4;
		foreach(msrc[p])
			begin
			$display(msrc[p]);
			$display(mdst[p]);
			end
		
		
	end
endmodule*/
module top;
	bit[31:0] msrc[5]={0,1,2,3,4},mdst[5]={5,4,3,2,1};
	initial
		begin
			if(msrc==mdst)
				$display("both are equal");
			else
				$display("not equal");
			mdst=msrc;
			if(msrc[0:4]==mdst[0:4])
				$display("both are equal");
			else
				$display("not equal");
			
			

		end





endmodule 


