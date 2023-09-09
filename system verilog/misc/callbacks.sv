//without modifying the existing functionality , we can achieve the desired operation

/* Components of slave_driver example are,

slave_driver – Normal driver to drive response
response types are OKAY, EXOKAY, SLVERR, DECERR
slave_driver is constrained to send OKAY response always to see to the callback usage difference
slave_env – Environment which has a slave driver created in it
basic_test – Which sends the normal response
error_test  – Testcase with callback method used to generate an error response
err_inject  – extended driver class to implement the callback method*/

typedef enum {OKAY,EXOKAY,SLVERR,DECERR}

class slave_driver;
    resp_type resp;

    virtual task update_resp;

    endtask

    task send_response;
        std::randomize(resp) with {resp == OKAY};
        update_resp();
    endtask

endclass


class err_inject extends slave_driver;

    virtual task update_resp;
        $display("injecting SLVERR");
        resp = SLVERR;
    endtask

endclass



program error_test;

slave_env env;
err_inject err_driver;

    initial
        begin
            
            env = new();
            err_driver = new();

            env.slv_driver = err_driver;

            env.run();    
            

        end

endprogram

