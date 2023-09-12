module imm_adder (pc_in,rs_1_in,iadder_src_in,imm_in,i_adder_out);

input iadder_src_in;
input [31:0] pc_in,rs_1_in,imm_in;
output [31:0] i_adder_out;


wire [31:0] w1;

assign w1 = (iadder_src_in) ? rs_1_in : pc_in;

assign i_adder_out = w1 + imm_in;

endmodule