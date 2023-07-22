class fifo_read_xtn;

//declaring variables to be randomized
rand bit rd_enb;
rand bit rd_reg;

//declaring non_rand variables
logic bit [7:0] dataout;
logic full;
logic empty;
logic over_flow;
logic underflow;
logic threshold;


//declaring static variables to count the transactions
static int no_of_xtns;
static int no_of_read_xtns;
static int no_of_read_reg_xtns;


//constraints to restrict the randomization range
constraint rd_reg_value {rd_reg dist {0:=90 , 1:=10};}

function void post_randomize();

    if(this.rd_reg == 1)
        no_of_read_reg_xtns++; 
    else if(this.rd_enb == 1)
        no_of_read_xtns++;
    
    no_of_xtns++;

    ifdef NEED_GEN_PKT
        this.print("\tRANDOMIZED DATA");
    endif

endfunction


function bit compare (input rd_xtn ref_mod_pkt , output string message);


endfunction

endclass