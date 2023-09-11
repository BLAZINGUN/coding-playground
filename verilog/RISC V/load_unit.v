module load_unit(ahb_resq_in,dmdata_in,iadder_out_1_to_0_in,load_unsigned_in,load_size_in,lu_output_out);

input ahb_resq_in,load_unsigned_in;
input [31:0] dmdata_in;
input [1:0] iadder_out_1_to_0_in,load_size_in;


output [31:0] lu_output_out;

endmodule