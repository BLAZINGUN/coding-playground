module priority_encoder_8x3(in,out);


input [7:0] in;
output [2:0] out;

always @(*)

    begin
       
        if(in == 8'b1xxxxxxx)
            out = 3'b111;
        else if (in == 8'b01xxxxxx)
            out = 3'b110;
        else if (in == 8'b001xxxxx)
            out = 3'b101;
        else if (in == 8'b0001xxxx)
            out = 3'b100;
        else if (in == 8'b00001xxx)
            out = 3'b011;
        else if (in == 8'b000001xx)
            out = 3'b010;
        else if (in == 8'b0000001x)
            out = 3'b001;
        else if (in == 8'b00000001)
            out = 3'b000;
        else
            out = 3'bxxx;
          
    end



endmodule