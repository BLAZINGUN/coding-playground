module sudoku;

class game;

rand bit [1:4] a[1:3][1:3];

constraint c1 { 

//rows
                a[1][1] + a[1][2] + a[1][3] == 4'b0100;
                a[2][1] + a[2][2] + a[2][3] == 4'b0100;
                a[3][1] + a[3][2] + a[3][3] == 4'b0100;
                
//diagonals
                a[1][1] + a[2][2]  + a[3][3] == 4'b0100;
                a[1][3] + a[2][2]  + a[3][1] == 4'b0100;
                
//columns
                a[1][1] + a[2][1] + a[3][1] == 4'b0100;
                a[1][2] + a[2][2] + a[3][2] == 4'b0100;
                a[1][3] + a[2][3] + a[3][3] == 4'b0100;
}



constraint c2 {foreach(a[i,j])
                   a[i][j] < 5;}
endclass


game g1;

initial
        begin
                g1 = new();
                assert(g1.randomize);
                for (int j = 1;j<4; j++)
                    begin
                         $display("%3p", g1.a[j]);
                    end
               
        end

endmodule
