module decoder_3x8(in,out);

input [2:0] in;
output [7:0] out;

//behavioral

always @(*)

    begin
        
        case(in)

        3'b000 : 8'b00000001;
        3'b001 : 8'b00000001;
        3'b010 : 8'b00000001;
        3'b011 : 8'b00000001;
        3'b100 : 8'b00000001;
        3'b101 : 8'b00000001;
        3'b110 : 8'b00000001;
        3'b111 : 8'b00000001;

        endcase


    end



always @(*)

    begin
        if (in == 3'b000)
            out = 8'b00000001;
        if (in == 3'b001)
            out = 8'b00000010; 
        if (in == 3'b010)
            out = 8'b00000100;
        if (in == 3'b011)
            out = 8'b00001000;
        if (in == 3'b100)
            out = 8'b00010000;
        if (in == 3'b101)
            out = 8'b00100000;           
        if (in == 3'b110)
            out = 8'b01000000;
        if (in == 3'b111)
            out = 8'b10000000; 

    end

endmodule