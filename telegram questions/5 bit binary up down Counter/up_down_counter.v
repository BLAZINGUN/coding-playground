`timescale 10ns/10ps

module up_down_counter(clk,reset,mode,dout);

input clk,reset,mode;

output reg[4:0] dout;


always@(posedge clk)

	begin

		if(~reset)

			dout <= 5'b00000;



		else if(mode == 1'b0)
			
			begin

				if(dout >= 5'b10000)
					dout <= 5'b00000;

				else 
					dout = dout + 1'b1;
			end



		else if(mode ==1'b1)

			begin

				if(dout == 5'b00000)
					dout <= 5'b10000;

				else 
					dout <= dout - 1'b1;
            end


	end


endmodule