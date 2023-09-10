module imm_gen (instr_in,imm_type_in,imm_out);
    
input [31:7] instr_in;
input [2:0] imm_type_in;

output [31:0] imm_out;


wire [31:0] w_i,w_s,w_b,w_u,w_j,csr;



assign w_i = {20{instr_in[31]}},instr_in[31:20]};
assign w_s = {20{instr_in[31]}},instr_in[31:25],instr_in[11:7]};
assign w_b = {20{instr_in[31]}},instr_in[7],instr_in[30:25],instr_in[11:8],1'b0};
assign w_u = {instr_in[31:12],12'h000};
assign w_j = {12{instr_in[31]}},instr_in[19:12],instr_in[20],instr_in[30:21],1'b0};
assign csr = {27'b0,instr_in[19:15]};



always @(imm_type_in,w_b,w_i,w_j,w_s,w_u,instr_in) 

    begin
        case (imm_type_in)
            3'b000 : imm_out = w_i;
            3'b001 : imm_out = w_i;
            3'b010 : imm_out = w_s;
            3'b011 : imm_out = w_b;
            3'b100 : imm_out = w_u;
            3'b101 : imm_out = w_j;
            3'b110 : imm_out = csr;
            3'b111 : imm_out = w_i;
            default: imm_out = w_i;
        endcase          
    end







endmodule