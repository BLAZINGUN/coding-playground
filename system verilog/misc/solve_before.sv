//without solve before

class packet;

    rand bit a;
    rand bit [3:0] b;
    
    constraint a_b { (a == 1) -> b == 0;}

endclass

module top;

initial 
    begin
        
        packet pkt;
        pkt = new();

        repeat(10)
                begin
                        assert(pkt.randomize());
                        $display("\t Value of a  = %0d", b = %0d, pkt.a,pkt.b );
                end
    end

endmodule


//with solve before

class packet;

    rand bit a;
    rand bit [3:0] b;

    constraint sab {solve a before b;}
    constraint a_b {(a==1) -> b == 0;}

endclass


module top;

initial 
    begin

        packet pkt;
        pkt = new();

        repeat(10)
            begin

                assert(pkt.randomize);
                $display("\t the value of a is %0d, value of b is %0b",pkt.a,pkt.b);

            end

    end
    
endmodule