module top;

bit [30:0] addr1;
bit [25:0] addr2;
bit [50:0] addr3;
int addr4;
shortint addr5;
longint addr6;


initial  
    
    begin

        addr1 = $random();
        addr2 = $urandom();
        addr3 = {$urandom,$urandom};
        addr4 = std::randomize(addr4) with {addr4 inside {[4:8]};};
        addr5 = $random % 20; //max value is 20
        addr6 = $urandom_range(30,40);

    $display("the value of addr1 is %d", addr1);
    $display("the value of addr2 is %d", addr2);
    $display("the value of addr3 is %d", addr3);
    $display("the value of addr4 is %d", addr4);
    $display("the value of addr5 is %d", addr5);
    $display("the value of addr6 is %d", addr6);


    end



endmodule