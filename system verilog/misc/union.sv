
module top;

union {    bit [5:0] age;
            shortint weight;
            enum {male,female} gender; } data;



initial

    begin
        
        data.gender = male;
        data.age = 30;
        data.weight = 1000;
       

//to display the whole struct use %p

$display("the values of the items of data are %p", data);

    end


endmodule
