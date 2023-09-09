module top;

int a[3][2];

initial 
    begin
        
        $display("---------------");

        foreach ( a[i,j])
            a[i][j] = i+j;
        
        foreach(a[i,j])
            $display(" \t value of a[%0d][%0d] = %0d", i,j,a[i][j]);

        $display("---------------");

    end

endmodule