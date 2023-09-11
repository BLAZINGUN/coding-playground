module reg_block_2(clk_in,rst_in,rd_addr_in,csr_addr_in,rs1_in,rs2_in,pc_in,pc_plus_4_in,branch_taken_in,iadder_in,alu_opcode_in,load_size_in,load_unsigned_in,alu_src_in,csr_wr_en_in,rf_wr_en_in,wb_mux_sel_in,csr_op_in,imm_in,rd_addr_reg_out,csr_addr_reg_out,rs1_reg_out,rs2_reg_out,pc_reg_out,pc_plus_4_reg_out,iadder_out_reg_out,alu_opcode_reg_out,load_size_reg_out,load_unsigned_reg_out,alu_src_reg_out,csr_wr_en_reg_out,rf_wr_en_reg_out,wb_mux_sel_reg_out,csr_op_reg_out,imm_reg_out);

input clk_in,rst_in,branch_taken_in,load_unsigned_in,alu_src_in,csr_wr_en_in,rf_wr_en_in,;
input [31:0] rs1_in,rs2_in,pc_in,pc_plus_4_in,iadder_in,imm_in;
input [4:0] rd_addr_in;
input [11:0] csr_addr_in;
input [3:0] alu_opcode_in;
input [1:0] load_size_in;
input [2:0] wb_mux_sel_in,csr_op_in;


output load_unsigned_reg_out,alu_src_reg_out,csr_wr_en_reg_out,rf_wr_en_reg_out;
output [31:0] rs1_reg_out,rs2_reg_out,pc_reg_out,pc_plus_4_reg_out,iadder_out_reg_out,imm_reg_out;
output [4:0] rd_addr_reg_out;
output [11:0] csr_addr_reg_out;
output [3:0] alu_opcode_reg_out;
output [1:0] load_size_reg_out;
output [2:0] wb_mux_sel_reg_out,csr_op_reg_out;

endmodule