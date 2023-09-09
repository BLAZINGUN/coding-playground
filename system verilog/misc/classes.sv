module top;


class automobiles ;

int wheels;
string type_;
int gears;
string mode;


function new();

wheels = $urandom_range(4,20);
type_ = "truck";
gears = $urandom_range(1,6);
mode = "automatic";

endfunction

endclass



class cars extends automobiles;

string company  ;
string model ;
string fuel;

function new(string company = "maruti" , string model = "sports");
    this.company = company;
    this.model = model;
endfunction

endclass


automobiles a1,a2;

cars c1,c2,c3,c4;



initial 

    begin

        a1 = new();
        a2 = new();


        a1.wheels = 2;
        a1.type_  =  "bike";       
        a1.mode = "manual";
        a1.gears = 4;


        c1 = new();
        c2 = new("mahindra","offroad");
        c3 = new();

        //copying 
        c4 = c1;


        c1.wheels = 4;
        c1.type_ = "car";
        c1.mode = "automatic";
        c1.gears = 6;
        c1.company = "TATA";
        c1.model = "SUV";
        c1.fuel = "diesel";


        $display("the values of a1 is %p ", a1);
        $display("the values of a2 is %p ", a2);
        $display("the values of c1 is %p ", c1);
        $display("the values of c2 is %p ", c2);
        $display("the values of c3 is %p ", c3);
        $display("the values of c4 is %p ", c4);

    end


endmodule

