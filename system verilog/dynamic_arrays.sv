module top;

// this is same as array_methods used on fixed arrays 

int array1[];

int array2[];

initial

    begin
    

    array1 = new[10];

    
    foreach (array1[i])
        array1[i] = i+2;

    $display("the array1 contains : %p" , array1);

    array2 = array1; //copying 

    //to increase the size of array1 while keeping the old ones intact
    array1 = new[30](array1);

    //we can check this by using size() method

    $display("the size of the array1 is %d " , array1.size());


    foreach(array1[i])
        begin
            if (i>10)
                array1[i] = $urandom_range (10,90);
        end

    $display("the array1 contains : %p" , array1);

    //to increase the size of array1 and deleting the old values
    array1 = new[20];


    $display("the array1 contains : %p" , array1);

    //to delete all the elements of an array
    array2.delete();





    end




endmodule