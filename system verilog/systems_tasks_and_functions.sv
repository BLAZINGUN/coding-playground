module  top;

//1 dimensional variable
logic [3:0] data;

//2 dimensional variable
logic [5:0] memory_2_dim [6:0];

int size_data;
int bits_data;

int size_memory;
int bits_memory;

//variable to work with $isunkknown
//this wont detect unknown variables as it is 2 state and x,z are converted to zero.
int uv;

int oh1;
int oh0;


//to detect x or z, use 4 state variables 
integer uv2;

integer bits_req;

//for one dimensional both $size and $bits give the same value
//for 2 dimensional $size gives the depth of the variable
//for 2 dimensional $bits gives the total bits required = width * depth





initial begin
    
    data = 10;

    for(int i = 0 ; i<7; i++)
    begin
        memory_2_dim   [i] = i;
        $display("the value of mem is %0d ", memory_2_dim[i]);
    end


// $size and $bits

    size_data = $size(data);
    bits_data = $bits(data);

    size_memory = $size(memory_2_dim);
    bits_memory = $bits(memory_2_dim);


$display("the value of data is %0d ", data);
$display("the value of size_data is %0d ", size_data);
$display("the value of bits_data is %0d ", bits_data);
$display("the value of size_memory is %0d ", size_memory);
$display("the value of bits_memory is %0d ", bits_memory);



// write prints messages in the same line
$write("good morning\t");
$write("welcome to sv practice");


// use \t for tab
//use \n for new line


uv = 6'b01zxz1;
uv2 = 6'bxxz00z;

oh1 = 5'b01000;
oh0 = 5'b00000;

bits_req = $clog2($size(data));


$display("\n the value of $isunknown  for uv is %0d ", $isunknown(uv));
$display("\n the value of $isunknown for uv2 is %0d ", $isunknown(uv2));


//to count any number or x or z  in any variable use $countbits

$display("the value of 1's in uv is %0d ", $countbits(uv , '1));
$display("the value of 0's in uv is %0d ", $countbits(uv , '0));
$display("the value of x's in uv is %0d ", $countbits(uv , 'x));    // x and z are converted to 0 since it is 2 state
$display("the value of z's in uv is %0d ", $countbits(uv , 'z));    // x and z are converted to 0 since it is 2 state


$display("the value of x's in uv2 is %0d ", $countbits(uv2 , 'x));   
$display("the value of z's in uv2 is %0d ", $countbits(uv2 , 'z));
$display("the value of x's and z's in uv2 is %0d ", $countbits(uv2 , 'x,'z));

//$countones , $onehot , $onehot0

$display("the value of 1's in uv is %0d ", $countones(uv));

//to check whether oh1 has only one 1.
$display("the value of onehot(oh1) is %0d ", $onehot(oh1));


//to check whether oh0 has no 1.
$display("the value of onehot0(oh0) is %0d ", $onehot0(oh0));


// no argument required for %m
$display("the scope is %m");

//to know how many bits are required to address a memory of a given size

$display("the value of bits_req is %0d ", bits_req);

end



endmodule