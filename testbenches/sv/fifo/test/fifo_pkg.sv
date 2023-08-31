
package fifo_pkg;

   int number_of_transactions=1;

        `include "fifo_trans.sv"
        `include "fifo_gen.sv"
        `include "fifo_write_bfm.sv"
        `include "fifo_read_bfm.sv"
        `include "fifo_write_mon.sv"
        `include "fifo_read_mon.sv"
        `include "fifo_model.sv"
        `include "fifo_sb.sv"
        `include "fifo_env.sv"

endpackage
