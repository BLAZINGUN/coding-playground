interface fifo_if(input bit clock);


logic [7:0] datain,dataout;
logic resetn;
logic wr_enb;
logic wr_reg;
logic rd_enb;
logic rd_reg;
logic full;
logic empty;
logic over_flow;
logic underflow;
logic threshold;



clocking wr_drv_cb @ (posedge clock);
default input #1 output #1;
output [7:0]datain;
output wr_enb;
output wr_reg;
output resetn;

input full;
input empty;
input over_flow;
input underflow;
input threshold;

endclocking



clocking wr_mon_cb @ (posedge clock);
default input #1 output #1;

input [7:0]datain;
input wr_enb;
input wr_reg;
input resetn;

input full;
input empty;
input over_flow;
input underflow;
input threshold;

endclocking


clocking rd_drv_cb @ (posedge clock);
default input #1 output #1;

output resetn;
output rd_enb;
output rd_reg;

input full;
input empty;
input over_flow;
input underflow;
input threshold;

endclocking


clocking rd_mon_cb @ (posedge clock);
default input #1 output #1;

input resetn;
input rd_enb;
input rd_reg;
input [7:0]dataout;

input full;
input empty;
input over_flow;
input underflow;
input threshold;

endclocking


modport WR_DRV (clocking wr_drv_cb);
modport WR_MON (clocking wr_mon_cb);
modport RD_DRV (clocking rd_drv_cb);
modport RD_MON (clocking rd_mon_cb);


endinterface
