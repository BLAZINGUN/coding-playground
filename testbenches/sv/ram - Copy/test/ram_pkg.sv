
package ram_pkg;

   int number_of_transactions=1;

        `include "ram_trans.sv"
        `include "ram_gen.sv"
        `include "ram_write_bfm.sv"
        `include "ram_read_bfm.sv"
        `include "ram_write_mon.sv"
        `include "ram_read_mon.sv"
        `include "ram_model.sv"
        `include "ram_sb.sv"
        `include "ram_env.sv"

endpackage
