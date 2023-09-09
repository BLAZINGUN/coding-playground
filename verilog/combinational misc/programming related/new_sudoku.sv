
module top;

class sudoku; 
 
  int M = 3;
  int N = M * M;
  rand bit[3:0] a[9][9];


    
    // The value of each a must be between 1 and N.
    constraint value {foreach ( a[row, col] ) 
                            a[row][col] inside {[ 1:N ]};}
    
    // The places on the same row must have unique values.
    constraint row_con  { foreach   (a[row, colA] ) 
                        { foreach (a[ row  , colB] ) 
                        { if ( colA != colB ) 
                        { a[row][colA] != a[row][colB]; } } } }
    
    // The places on the same column must have unique values.
    constraint column_con { foreach   ( a[rowA, col] ) 
                          { foreach ( a[rowB,  col  ] ) 
                          { if ( rowA != rowB ) 
                          { a[rowA][col] != a[rowB][col]; } } } }
    
    // The places in the same MxM block must have unique values.
    constraint block_con { foreach(a[rowA,colA]) 
                         {foreach ( a[rowB, colB] ) 
                         { if ( rowA / M == rowB / M && colA / M == colB / M &&  ! ( rowA == rowB && colA == colB ) ) 
                         { a[rowA][colA] != a[rowB][colB]; } } } }
endclass

sudoku  s1;

initial
    begin
        s1 = new();
        repeat(1)
            begin
                assert(s1.randomize);
                for(int i=0;i<9;i++)
                    begin
                        $display("%p",s1.a[i]);
                    end
              $display();
            end
    end
                                                                           
endmodule


'{2, 4, 9, 6, 8, 3, 7, 5, 1}
'{8, 7, 3, 1, 5, 4, 9, 6, 2}
'{6, 1, 5, 2, 7, 9, 3, 4, 8}
'{4, 6, 7, 5, 2, 8, 1, 3, 9}
'{3, 9, 8, 4, 6, 1, 2, 7, 5}
'{1, 5, 2, 9, 3, 7, 4, 8, 6}
'{7, 3, 6, 8, 1, 2, 5, 9, 4}
'{5, 2, 4, 7, 9, 6, 8, 1, 3}
'{9, 8, 1, 3, 4, 5, 6, 2, 7}