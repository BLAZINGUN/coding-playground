module instruction_mux (flush_in,instr_in,opcode_out,funct3_out,funct7_out,rs1addr_out,rs2addr_out,csr_addr_out,rdaddr_out,csr_addr_out,instr_out[31:7]);
    
    input flush_in;
    input [31:0] instr_in;

    output [6:0] opcode_out;
    output [2:0] funct3_out;
    output [6:0] funct7_out;
    output [4:0] rs1addr_out;
    output [4:0] rs2addr_out;
    output [4:0] rdaddr_out;
    output [11:0] csr_addr_out;
    output [31:7] instr_out;

wire [31:0] w1 = 32'h00000013;

assign opcode_out = flush_in ? w1[6:0] : instr_in[6:0];
assign funct3_out = flush_in ? w1[14:12] : instr_in[14:12];
assign funct7_out = flush_in ? w1[31:25] : instr_in[31:25];
assign csr_addr_out = flush_in ? w1[31:20] : instr_in[31:20];
assign rs1addr_out = flush_in ? w1[19:15] : instr_in[19:15];
assign rs2addr_out = flush_in ? w1[24:20] : instr_in[24:20];
assign rdaddr_out = flush_in ? w1[11:7] : instr_in[11:7];
assign instr_out = flush_in ? w1[31:7] : instr_in[31:7];


endmodule