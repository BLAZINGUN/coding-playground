// disable is similar to break in c language , except that it should have a block identifier 



module disable_ex (b,a,en);

input [3:0] a;
input en;
output reg b;

integer i;

always @(posedge en)

    begin : OR_gate
        
        b = 1'b0;
            for(i = 0; i<=3; i = i+1)
                    if(a[i] == 1'b1)
                        begin 
                            b = 1'b1;
                            disable OR_gate;
                        end
    end


endmodule