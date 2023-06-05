module multiplier(a,b,product);

parameter a_width = 8; b_width = 8;
local_param product_width = a_width +b_width;

input [a_width-1:0] a;
input [b_width-1:0] b;
output [product_width-1:0] product;

generate 

    if(a_width < 8) || (b_width < 8))

        CLA_multiplier #(a_width,b_width) u1(a,b,product);

    else
        
        WALLACE_multiplier #(a_width,b_width) u2(a,b,product);

endgenerate

endmodule