module machine_control (clk_in,rst_in,eirq_in,tirq_in,sirq_in,illegal_instr_in,misaligned_store_in,misaligned_load_in,misaligned_instr_in,opcode_6_to_2_in,funct3_in,funct7_in,rs1_addr_in,rs2_addr_in,rd_addr_in,mie_in,meie_in,mtie_in,msie_in,meip_in,mtip_in,msip_in,i_or_e_out,cause_out,instret_inc_out,mie_clear_out,mie_set_out,misaligned_exception_out,set_epc_out,set_cause_out,flush_out,trap_taken_out,pc_src_out);
    
input clk_in,rst_in,eirq_in,tirq_in,sirq_in,illegal_instr_in,misaligned_store_in,misaligned_load_in,misaligned_instr_in,mie_in,meie_in,mtie_in,msie_in,meip_in,mtip_in,msip_in;
input [2:0] funct3_in;
input [4:0] opcode_6_to_2_in,rs1_addr_in,rs2_addr_in,rd_addr_in;
input [6:0] funct7_in;

output i_or_e_out,instret_inc_out,mie_clear_out,mie_set_out,misaligned_exception_out,set_epc_out,set_cause_out,flush_out,trap_taken_out;
output [3:0] cause_out;
output [1:0] pc_src_out;



endmodule