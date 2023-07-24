class wr_xtn ;

//declaring varibles as rand
rand bit [7:0] datain;
rand bit wr_enb;
rand bit wr_reg;
rand bit resetn;

//declaring variables as static to count each type of transaction
static no_of_reset_xtns;
static no_of_write_xtns;
static no_of_write_reg_xtns;
static no_of_xtns;

//giving constraints to get desired testcases
constraint reset_value { resetn dist {0:= 2 , 1:= 98}; }
constraint wr_reg_value {wr_reg dist {0:=90 , 1:=10};}
constraint wr_reg_data {if(wr_reg)
                            datain inside {[5:15]};}



//print function
function void print(input string message);

$display("******************************************************");
$display("%s",message);
if(message == "\tRANDOMIZED DATA")
    begin
        $display("______________________________________________");
        $display("\tNo.of transactions : %0d", no_of_xtns);
        $display("\tNo.of reset transactions : %0d", no_of_reset_xtns);
        $display("\tNo.of write transactions : %0d", no_of_write_xtns);
        $display("\tNo.of write reg transactions : %0d",no_of_write_reg_xtns);
        $display("______________________________________________");
    end
$display("\txtn_no = %0d", no_of_xtns);
$display("\tReset = %0d", resetn);
$display("\twr_enb = %0d", wr_enb);
$display("\twr_reg = %0d", wr_reg);
$display("\tdatain = %0d", datain);

$display("******************************************************");

endfunction


function void post_randomize();

    if(this.resetn == 0)
        no.no_of_reset_xtns++;
    else if(this.wr_reg == 1)
        no_of_write_reg_xtns++;
    else if(this.wr_enb == 1)
        no_of_write_xtns++;

    no_of_xtns++;

    ifdef NEED_GEN_PKT
        this.print("\tRANDOMIZED DATA");
    endif

endfunction

endclass
