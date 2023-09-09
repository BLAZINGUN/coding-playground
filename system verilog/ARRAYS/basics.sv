module top;

class example;


//unpacked arrays


//vertical array with elements of size 1 bit and the index of the first element is 3.
bit a[3:0];
bit b[4]; // this can also be written as bit b[0:3] not bit b[3:0] , when we directly specify  the size , the indexing starts from 0.



int c[0:3]; //vertical array with elements of size 32 bit and the index of the first element is 0.

//bit d[1:3][1:3]; //two dimensional 3x3 array with element size of 1 bit


bit [1:0] d[1:3][1:3]; //two dimensional 3x3 array with element size of 2 bit

endclass


example e1;


initial
        begin
                e1 = new();

                /*
                foreach(e1.c[i])
                        begin
                                e1.c[i] = i;
                                $display("a[%0d] = %0d ",i,e1.c[i]);
                        end
                */


                /*
                //this gives error as vertical unpacked arrays cannot be directly assigned
                e1.c = 4'd24;
                $display("the value of c is %p" , e1.c);
                */


                /*
                foreach (e1.d[i,j])
                        begin
                                e1.d[i][j] = i;

                        end
                */


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
