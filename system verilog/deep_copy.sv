//deep copy copies all the properties and methods of all the sub-classes of a particular class handle
//user defined methods need to be added


class address_range;

    bit [31:0] start_address;
    bit [31:0] end_address;

function new();

    start_address = 10;
    end_address = 50;

endfunction

//user-defined copy method

function address_range copy;

    copy = new();
    copy.start_address = this.start_address;
    copy.end_address = this.end_address;
    return copy;

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

        $display("\t addr  = %0h",addr);
        $display("\t data  = %0h",data);
        $display("\t start_address  = %0d",ar.start_address);
        $display("\t end_address  = %0d",ar.end_address);

    endfunction

    function packet copy();
        copy = new();
        copy.addr = this.addr;
        copy.data = this.data;
        copy.ar = this.ar;
        return copy;
    endfunction

module top;

packet p1;
packet p2;

initial 
    begin
        
        p1 = new();
        $display("calling display of p1");
        p1.display();

        p2 = new();
        $display("calling display of p2");
        p2.display();

        p2 = p1.copy();

        //changing values using p2

        p2.addr = 32'h63;
        p2.ar.start_address = 20;
        p2.ar.end_address = 30;

        //calling display of p1 and p2

        p1.display();
        p2.display();

    end

endmodule