module top;


//remove comments if you want to work with fixed array

//int array [10];


//dynamic arrays
int array [];


//dynamic array 
int res[];


initial  

    begin

        array = new[10];
        array = '{2,4,6,8,1,3,5,7,4,8};

        res = array.find(x) with (x>4);
            $display("\nfind(x) : %p",res);

        res = array.find_index with (item == 5);
            $display("\nfind_index : res[%0d] = 5",res[0]);
        
        res = array.find_first with (item>6);
            $display("\nfind_first : %p ",res);

        res = array.find_first_index(x) with (x == 8); 
            $display("\nfind_first_index : %p", res);

        res = array.find_last(x) with (x < 4);
            $display("\nfind_last : %p" , res);

        res = array.find_last_index(x) with (x > 6);
            $display("\nfind_last_index : %p " , res);

        res = array.min() ;
            $display("array.min : %p" , res);

        res = array.max() ;
            $display("array.max : %p" , res);

        res = array.unique() ;
            $display("array.unique : %p" , res);

        res = array.unique(x) with (x>3) ;
            $display("array.unique(x) : %p" , res);

        res = array.unique_index() ;
            $display("array.unique_index : %p" , res);
    

        foreach(array[i])
            begin
                
                array[i] = $urandom_range(0,1);
                

            end

        $display("the values stored in array are : %p " , array);

        res = array.find(x) with(x == 0);
        $display("the value of array is %p" , res);

        res = array.find_index(x) with(x == 0);
        $display("the indices of array where 0 is present is %p" , res);       
    
        res = array.find_index(x) with(x == 1);
        $display("the indices of array where 1 is present is %p" , res);


        //array ordering 

        array = '{2,4,6,8,1,3,5,7,4,8};

        array.reverse();
        res = array;
        $display("the array res contains : %p" , res );

        array.sort();
        res = array;
        $display("the array res contains : %p" , res );

        array.rsort();
        res = array;
        $display("the array res contains : %p" , res );        

        array.shuffle();
        res = array;
        $display("the array res contains : %p" , res );

        array.sort(x) with (x>4);
        res = array;
        $display("the array res contains : %p" , res );

        array.rsort(x) with (x<5);
        res = array;
        $display("the array res contains : %p" , res );



        //array reduction methods

        array = '{2,4,6,8,1,3,5,7,4,8};

        $display("sum = %0d", array.sum());
        $display("sum = %0d", array.sum() with (item>5));
        $display("product = %0d" , array.product());
        $display("product = %0d" , array.product() with (item < 6));
        $display("and  = %0h" , array.and());
        $display("or = %0h", array.or());
        $display("xor = %0h ",array.xor());
        


    end



endmodule