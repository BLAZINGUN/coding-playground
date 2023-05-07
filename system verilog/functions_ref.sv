module top;


int ma  = 20;

function void pass_by_value(int fa);

    fa = fa*2;
    $display("inside function pass by value : fa = %d",fa);
    
endfunction


//whatever changes occur inside the function also reflects to the varaible outside the function
//task or function should be automatic when used with ref.
function automatic void pass_by_ref( ref int fa);

    fa = fa*2;
    $display("inside the function pass by ref : fa = %d",fa);

endfunction

initial 

    begin
        
        pass_by_value(ma);
        $display("after calling function pass by value : ma = %d", ma);

        pass_by_ref(ma);
        $display("after calling function pass by ref : ma =%d", ma);

    end

endmodule