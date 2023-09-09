//struct without typedef

module top;

struct {    bit [5:0] age;
            shortint weight;
            string name;
            enum {male,female   } gender; } data;



initial

    begin

        data.age = 30;
        data.name = "hulk";
        data.weight = 1000;
        data.gender = male;

//to display the whole struct use %p

$display("the values of the items of data are %p", data);

    end


endmodule
