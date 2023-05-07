module top;


//using typedef to make data as struct datatype
// use packed keyword to make it a packed struct

//strings cannot be used in packed structs

typedef struct packed {    bit [5:0] age;
            shortint weight;
            enum {male,female} gender; } data;

// 3 types of assignments to struct

data person1 ;
data person2 = '{25,700,female};
data person3 = '{age : 35 , weight : 50  ,gender : male};


initial
    
    begin

        person1.age = 30;
        person1.weight = 1000;
        person1.gender = male;

//to display the whole struct use %p

$display("the values of the items of person1 are %p", person1);
$display("the values of the items of person2 are %p", person2);
$display("the values of the items of person3 are %p", person3);


    end


endmodule