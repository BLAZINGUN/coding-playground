module sudoku;

class example;

int number = 3;
rand int a[number][number];

constraint row_sum      {     foreach(a[i])
                            a[i][0]+a[i][1]+a[i][2] == 4;                        
                        }

constraint column_sum   {     foreach(a[j])
                            a[0][j]+a[1][j]+a[2][j] == 4;                        
                        }

constraint diagonal     {   a[0][0]+a[1][1]+a[2][2] == 4;
                            a[0][2]+a[1][1]+a[2][0] == 4;  
                        }

function void post_randomize();
    $display("Generated 3x3 matrix");
    foreach(a[i])
        begin
            foreach(a[j])
                begin
                   $write("%0d",a[i][j]); 
                end
            $display("");
        end
endfunction

endclass

example e1;

initial 
    begin
        e1 = new;
        repeat(10)
        assert(e1.randomize);
    end

endmodule