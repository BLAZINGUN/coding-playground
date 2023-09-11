module csr_file (i_or_e_in,cause_in,instret_inc_in,mie_clear_in,mie_set_in,set_epc_in,set_cause_in,clk_in,rst_in,meie_out,mtie_out,msie_out,meip_out,mtip_out,msip_out,eirq_in,sirq_in,tirq_in,rc_in,csr_addr_in,csr_op_in,csr_uimm_in,csr_data_in,pc_in,iadder_in,trap_address_out,epc_out,csr_data_out,mie_out,wr_en_in);
    
input i_or_e_in,instret_inc_in,mie_clear_in,mie_set_in,set_epc_in,set_cause_in,clk_in,rst_in,eirq_in,sirq_in,tirq_in,wr_en_in;
input [3:0] cause_in;
input [31:0] iadder_in,pc_in,csr_data_in;
input [11:0] csr_addr_in;
input [2:0] csr_op_in;
input [4:0] csr_uimm_in;

output [31:0] csr_data_out,trap_address_out,epc_out;
output mie_out;



endmodule