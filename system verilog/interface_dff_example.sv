interface dff_if(input clk);

logic d0,d1,sel,rst,q;

parameter thold = 2,tsetup = 4;

clocking cb @ (posedge clk);

    default input #(tsetup) output #(thold);
    output d0,d1,rst,sel;
    input q;
endclocking

modport DUV (input d0,d1,rst,sel,clk, output q);


//task for checking reset

task sync_reset;

    cb.rst <= 1'b1;
    cb.sel <= $random;
    cd.d0  <= 1'b1;
    cb.d1  <= 1'b1;

    repeat(2)
        @(cb);

    if(cb.q!==0)
        begin
            $display("reset is not working");
            $stop;
        end

    else
        $display("reset is working well");
endtask




//task for checking d0;

task load_d0;

    input data;

    cb.rst <= 1'b0;
    cb.sel <= 1'b0;
    cb.d0  <= data;
    cb.d1  <= ~data;


    repeat(2)
        @(cb);


    if(cb.q !== data)
        begin
            $display("d0 is not working");
            $stop;
        end
    else
        $display("d0 is working");

endtask


modport TEST (clocking cb , import task sync_reset(), import task load_d0());

endinterface