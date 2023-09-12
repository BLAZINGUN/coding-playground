module reg_block1 (pc_mux_in,clk_in,rst_in,pc_out);
    

input [31:0] pc_mux_in;
input clk_in,rst_in;
output [31:0] pc_out;

always @(clk_in) 
    begin
        if(rst_in)
            pc_out <= 0;
        else
            pc_out <= pc_mux_in;
    end



endmodule