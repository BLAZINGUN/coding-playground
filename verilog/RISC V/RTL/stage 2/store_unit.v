module store_unit(funct3_in,iadder_in,rs2_in,mem_wr_req_in,ahb_ready_in,dmdata_out,dmaddr_out,dmwr_mask_out,dmwr_req_out,ahb_htrans_out);

input mem_wr_req_in,ahb_ready_in;
input [1:0] funct3_in;
input [31:0] iadder_in,rs2_in;

output [31:0] dmaddr_out,dmaddr_out;
output [3:0] dmwr_mask_out  ;
output dmwr_req_out;
output [1:0] ahb_htrans_out;


endmodule