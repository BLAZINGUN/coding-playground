class rd_xtn;

//rand variables
rand bit rd_enb;
rand bit rd_reg;


//non-rand variables
logic [7:0] dataout;

logic full;
logic empty;
logic underflow;
logic over_flow;
logic threshold;


//static variables
static int no_of_xtns;
static int no_of_read_xtns;
static int no_of_read_reg_xtns;



//constraints to restrict randomization
constraint read_reg_value {rd_reg dist {0:=90 , 1:=10};}


function void print(input string message);

$display("*****************************************");
$display("%s" , message);

if(message == "\tRANDOMIZED DATA")
        begin
        $display("\t_______________________________________");
        $display("\tNo.of rd_reg transactions", no_of_read_xtns);
        $display("\tNo.of_read_transactions", no_of_read_reg_xtns);
        $display("\t_______________________________________");
        end

$display("\txtn_no  = %0d", no_of_xtns);
$display("\trd_enb  = %0d", rd_enb);
$display("\trd_reg  = %0d",rd_reg);
$display("\tdataout  = %0d",dataout);
$display("\tfull  = %0d",full);
$display("\tempty  = %0d",empty);
$display("\tover_flow  = %0d",over_flow);
$display("\tunderflow  = %0d",underflow);
$display("\tthreshold  = %0d",threshold);
$display("*****************************************");
endfunction



function void post_randomize();
        if(this.rd_reg == 1)
                no_of_rd_reg_xtns++;
        else if (this.rd_enb == 1)
                no_of_rd_enb_xtns++;
        no_of_xtns++;

        `ifdef NEED_GEN_PKT
                this.print("\tRANDOMIZED DATA");
        `endif
endfunction





function bit comapare (input rd_xtn ref_mod_pkt , outut string message );

        begin
                if(this.dataout != ref_mod_pkt.dataout)
                        begin
                                message = "***********1. DATAOUT MISMATCH****************"
                                return(0);
                        end

                else if(this.full != ref_mod_pkt.full)
                        begin
                                message = "***********2. FULL MISMATCH****************"
                                return(0);
                        end

                else if(this.empty != ref_mod_pkt.empty)
                        begin
                                message = "***********3.EMPTY MISMATCH****************"
                                return(0);
                        end
                else if(this.over_flow != ref_mod_pkt.over_flow)
                        begin
                                message = "***********4. OVERFLOW MISMATCH****************"
                                return(0);
                        end
                else if(this.underflow != ref_mod_pkt.underflow)
                        begin
                                message = "***********5. UNDERFLOW MISMATCH****************"
                                return(0);
                        end
                else if(this.threshold != ref_mod_pkt.threshold)
                        begin
                                message = "***********6. THRESHOLD MISMATCH****************"
                                return(0);
                        end
                else
                        begin
                                message = "***********PERFECTLY MATCHED********************"
                                return(1);
                        end

        end


endfunction

endclass
