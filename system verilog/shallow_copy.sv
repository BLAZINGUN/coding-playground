//object will be created only after using the new keyword with the class handle
//after shallow copy both point to the same object 
//changes made to one will reflect in another handle also

class address_range;

    bit [31:0] start_address;
    bit [31:0] end_address;

    function new();

        start_address = 10;
        end_address = 50;

    endfunction

endclass


class packet;

    bit [31:0] addr;
    bit [31:0] data;

    address_range ar;

    function new();

        addr = 32'h10;
        data = 32'hFF;

        ar = new();

    endfunction


    function void display();

    $display("\t addr = %0h", addr);
    $display("\t data = %0h", data);
    $display("\t start address = %0d", ar.start_address);
    $display("\t end address = %0d", ar.end_address);

    endfunction

endclass




module top;


    packet p1;
    packet p2;

    initial 
        begin
            
            p1 = new();
            $display("calling p1 display");
            p1.display();

            p2 = new p1;

            $display("\t calling p2 display");
            p2.display();

            //changing values with p2 handle

            p2.addr = 32'h68;
            p2.ar.start_address = 60;
            p2.ar.end_address = 80;

            $display("calling p1 and p2 display after changing values from p2");

            p1.display();

            p2.display();


        end 


endmodule