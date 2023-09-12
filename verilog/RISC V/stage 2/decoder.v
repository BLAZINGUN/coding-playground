module decoder (trap_taken_in,funct7_5_in,opcode_in,funct3_in,iadder_out_1_to_0_in,wb_mux_sel_out,imm_type_out,csr_op_out,mem_wr_req_out,alu_opcode_out,load_size_out,load_unsigned_out,alu_src_out,iadder_src_out,csr_wr_en_out,rf_wr_en_out,illegal_instr_out,misaligned_load_out,misaligned_store_out);
    
    input trap_taken_in,funct7_5_in;
    input [6:0] opcode_in;
    input [2:0] funct3_in;
    input [1:0] iadder_out_1_to_0_in;

    output mem_wr_req_out,load_unsigned_out,alu_src_out,iadder_src_out,csr_wr_en_out,rf_wr_en_out,illegal_instr_out,misaligned_load_out,misaligned_store_out;
    output [2:0] wb_mux_sel_out,imm_type_out,csr_op_out;
    output [3:0] alu_opcode_out;
    output [1:0] load_size_out;


assign alu_opcode_out[2:0]  = funct3_in;
assign csr_op_out = funct3_in;



wire is_branch,is_jal,is_jalr,is_auipc,is_lui,is_op,is_op_imm,is_load,is_store,is_system,is_misc_mem;
wire w0,w2,w3,w7,w6,w4;


always @(opcode_in[6:2]) 
    begin
        case(opcode_in[6:2])
            5'b11000 : is_branch = 1'b1;
            5'b11011 : is_jal = 1'b1;
            5'b11001 : is_jalr = 1'b1;
            5'b00101 : is_auipc = 1'b1;
            5'b01101 : is_lui = 1'b1;
            5'b01100 : is_op = 1'b1;
            5'b00100 : is_op_imm = 1'b1;
            5'b00000 : is_load = 1'b1;
            5'b01000 : is_store = 1'b1;
            5'b11100 : is_system = 1'b1;
            5'b00011 : is_misc_mem = 1'b1;
            default  : {is_branch,is_jal,is_jalr,is_auipc,is_lui,is_op,is_op_imm,is_load,is_store,is_system,is_misc_mem} = 0;
        endcase
    end



always @(funct3_in) 
    begin
        case(funct3_in)
            3'b000 : w0 = 1;
            3'b010 : w2 = 1;
            3'b011 : w3 = 1;
            3'b100 : w4 = 1;
            3'b110 : w6 = 1;
            3'b111 : w7 = 1;
            default  : {w0,w2,w3,w7,w6,w4} = 0;
        endcase
    end



wire is_addi,is_slti,is_sltui,is_andi,is_ori,is_xori;

assign is_addi = is_op_imm && w0;
assign is_slti = is_op_imm && w2;
assign is_sltui = is_op_imm && w3;
assign is_andi = is_op_imm && w4;
assign is_ori = is_op_imm && w6;
assign is_xori = is_op_imm && w7;



wire nor_;

assign nor_ = ~(is_addi || is_slti || is_sltui || is_andi || is_ori || is_xori);


assign alu_opcode_out[3] = nor_ && funct7_5_in;




wire is_implemented_instr;

assign illegal_instr_out = (~is_implemented_instr || ~opcode_in[1] || ~opcode_in[0]);







//functionality block

assign rf_wr_en_out = (is_lui || is_auipc || is_jalr || is_jal || is_op || is_load || is_csr || is_op_imm ); 

assign imm_type_out[0] = (is_op_imm || is_load || is_jalr || is_branch || is_jal);
assign imm_type_out[1] = (is_store || is_branch || is_csr);
assign imm_type_out[2] = (is_lui || is_auipc || is_jal || is_csr);

assign wb_mux_sel_out[0] = (is_load || is_auipc || is_jal || is_jalr);
assign wb_mux_sel_out[1] = (is_lui || is_auipc);
assign wb_mux_sel_out[2] = (is_csr || is_jal || is_jalr);

assign iadder_src_out = (is_load || is_store || is_jalr);


endmodule