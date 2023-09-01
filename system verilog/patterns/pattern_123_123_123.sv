module top;

class example;
        bit [1:0] d[1:3][1:3]; //two dimensional 3x3 array with element size of 2 bit
endclass

example e1;

initial
        begin
                e1 = new();

                foreach (e1.d[i,j])
                        begin
                                e1.d[i][j] = j;
                        end

                for (int i = 1;i<4;i++)
                        begin
                                for (int j = 1; j<4;j++)
                                        begin
                                                $write("%0d",e1.d[i][j]);
                                        end
                                $display();
                        end
        end

endmodule


123
123
123