module pc_mux(rst_in,pc_src_in,epc_in,boot_address,trap_address_in,branch_taken_in,iaddr_in,ahb_ready_in,pc_in,iaddr_out,pc_plus_4_out,misaligned_instr_logic_out,pc_mux_out);

input [1:0] pc_src_in;
input [31:0] epc_in,trap_address_in,pc_in,boot_address;
input [30:0] iaddr_in;
input rst_in,branch_taken_in,ahb_ready_in;


output misaligned_instr_logic_out;
output [31:0] iaddr_out,pc_plus_4_out,pc_mux_out;


wire [31:0] iaddr_in_concat,next_pc,w1;


assign iaddr_in_concat = {iaddr_in,1'b0};
assign pc_plus_4_out = pc_in + 32'd4;
assign misaligned_instr_logic_out = branch_taken_in && next_pc[1]; 


always @(branch_taken_in,iaddr_in_concat,pc_plus_4_out) 
    begin
      case(branch_taken_in)

        1'b0 : next_pc = pc_plus_4_out; 
        1'b1 : next_pc = iaddr_in_concat;
        default : next_pc = 32'bz;
      endcase  
    end


always @(pc_src_in,trap_address_in,epc_in,boot_address,next_pc)
    begin
        case(pc_src_in)
            2'b00 : pc_mux_out = boot_address; 
            2'b00 : pc_mux_out = epc_in;
            2'b00 : pc_mux_out = trap_address_in;
            2'b00 : pc_mux_out = next_pc;
        endcase
    end


always @(ahb_ready_in,pc_mux_out,iaddr_out) 
    begin
        case(ahb_ready_in)
            1'b0 : w1 = iaddr_out;
            1'b1 : w1 = pc_mux_out;
        endcase        
    end


always @(rst_in) 
    begin
        case(rst_in)
            1'b0 : iaddr_out = w1;
            1'b1 : iaddr_out = boot_address;
        endcase
    end


endmodule