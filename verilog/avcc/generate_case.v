module add_sub(a,b,mode,o1,o2);

input a,b,mode;

output o1,o2;

generate 

    if (mode == 1)

    half_adder (a,b,o1,o2);

    else

    half_subtractor (a,b,o1,o2);

endgenerate


endmodule
