
module top;

class matrix;

rand bit [2:0] m[3][3];

constraint row_sum { foreach(m[i])
                        m[i][0]+m[i][1]+m[i][2] == 4;}

constraint column_sum { foreach(m[j])
                        m[0][j]+m[1][j]+m[2][j] == 4;}

endclass

matrix m1;

initial 

begin
    m1 = new;
    repeat(5)
      begin
        assert(m1.randomize);
    
    for(int i=0; i<3; i++)
        begin
            $display("%p",m1.m[i]);
        end
        $display();
      end
end

endmodule




'{0, 2, 2}
'{1, 2, 1}
'{3, 0, 1}

'{1, 1, 2}
'{2, 0, 2}
'{1, 3, 0}

'{2, 2, 0}
'{2, 1, 1}
'{0, 1, 3}

'{3, 0, 1}
'{0, 3, 1}
'{1, 1, 2}

'{1, 2, 1}
'{2, 2, 0}
'{1, 0, 3}