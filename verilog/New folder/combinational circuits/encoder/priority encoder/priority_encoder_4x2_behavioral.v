`timescale 10ns/10ps

module priority_encoder_4x2_behavioral(A0,A1,Y0,Y1,Y2,Y3);

input Y0,Y1,Y2,Y3;
output A0,A1;

reg A0,A1;

always @ (Y0,Y1,Y2,Y3)
begin
 A1 = Y3 + Y2;
 A0 = Y3 + ((~Y2)&Y1);
end
endmodule

