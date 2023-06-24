module priority_encoder(i,o);

input [3:0] i;
output reg [1:0]o;

always@(i)

	begin
		
		case(i)

		4'b1xxx : 2'b11;
		4'b01xx : 2'b10;
		4'b001x : 2'b01;
		4'b0001 : 2'b00;
		default : 2'bxx;

		endcase


	end

endmodule