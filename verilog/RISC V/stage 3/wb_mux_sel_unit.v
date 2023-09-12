module wb_mux_sel_unit(alu_src_reg_in,wb_mux_sel_reg_in,alu_result_in,lu_output_in,imm_reg_in,iadder_out_reg_in,csr_data_in,pc_plus_4_reg_in,rs2_reg_in,wb_mux_out,alu_2nd_src_mux_out);

input alu_src_reg_in;
input [31:0] alu_result_in,lu_output_in,imm_reg_in,iadder_out_reg_in,csr_data_in,pc_plus_4_reg_in,rs2_reg_in;
input [2:0] wb_mux_sel_reg_in;

output [31:0] wb_mux_out,alu_2nd_src_mux_out;




endmodule