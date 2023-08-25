

module top;

class example;

rand bit [2:0][3:0] a;  // this is not equal to bit [3][4]a
rand bit [3][4] b;      // this is same as bit [0:2][0:3]b

rand string [12:0][7:0] d; // cant have packed array of string, byte, int.
rand bit [0:3][0:7] c[10]; // packed array of depth 10 with 4 slots with each slot having 8 elements. 

endclass

example e1;

initial
        begin
                e1 = new();
                assert(e1.randomize);

                e1.a = e1.b;

                e1.a = '{9,3,2};
                e1.b = '{9,3,2};

                $display("%p",e1.a);
                $display("%p",e1.b);

                $display("%p",e1.a[2]);
                $display("%p",e1.b[2]);
        end

endmodule




