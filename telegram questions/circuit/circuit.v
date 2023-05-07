module circuit (s1,s2,s3,m1,m2);

input s1,s2,s3;

output reg m1,m2;


always@(s1,s2,s3)

	begin

	case({s1,s2,s3})
    
	3'b000 : {m1,m2} = 2'b00;
	3'b001 : {m1,m2} = 2'b00;
	3'b010 : {m1,m2} = 2'b10;
	3'b011 : {m1,m2} = 2'b00;
	3'b100 : {m1,m2} = 2'b10;
	3'b101 : {m1,m2} = 2'b00;
	3'b110 : {m1,m2} = 2'b00;
	3'b111 : {m1,m2} = 2'b01;
	default : {m1,m2} = 2'b00;

	endcase

    end

endmodule