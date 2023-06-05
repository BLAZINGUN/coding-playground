module dff_tb;

reg d0,d1,sel,rst,clk;

wire q;

parameter thold = 5;
          tsetup = 5;
          cycle = 100;

always 
    begin

        #(cycle/2)
        clk = 1'b0;
        #(cycle/2)
        clk = 1'b1;
    end

task sync_reset;

    begin

        rst <= 1'b1;
        d0  <= 1'b1;
        d1  <= 1'b1;
        sel <= $urandom(0,1);
    
        @(posedge clk)
        #thold
        if(q !==1'b0)
            begin
                $display("reset is not working");
                $stop;
            end
        
        $display("reset is working");
            {rst,d0,d1,sel} <= 4'bx;
            #(cycle-thold-tsetup);
    end
    


endtask