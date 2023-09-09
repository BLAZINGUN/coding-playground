//unpacked arrays
//Dimension of the array declared after array name declaration

//packed arrays
//Dimension of the array declared before array name declaration


//format { datatype [no.of elements][size of each element] arrayname [no. of rows][no. of columns];


module top;

/*
//declarations

bit ar[3] , br[3];

bit array1 [6];  //fixed ,single dimension , new format

bit array2 [5:0]; // same as above but using old format

int array3 [3:0][4:0] ; //fixed multi dimensional array , row ,column

bit [2:0] array4 [5:0][6:0]; // unpacked array;

bit [4:0][6:0]array5; //packed array

bit [3:0][5:0] array6[4:0][7:0]; //mix of unpacked and packed array

int array7 [2][3][4];
*/




//assignments


//byte a[8] = '{1,2,3,4,5,6,7,8};

//int ab[10] = $urandom_range(20,40);

parameter rows = 3;
parameter columns = 4;


//unpacked arrays

int ar[3] , br [3];

int array1[6]; // this is equal to array1[0:5]

int array2[5:0]; // be careful with indexing 

int array3 [rows][columns];

//int array3[0:2][0:3];
//int array3[2:0][3:0];




//packed arrays

bit [3:0][4:0] list ;
bit [3:0][4:0] list2 [5:0];









initial 
    
    begin

        ar = '{2,4,6};
        br = '{1,3,5};

        array1 = '{2,4,5,6,8,9};
        array2 = {ar,br};

        array3 = '{'{3,5,7,4},'{8,0,9,2},'{6,2,7,1}};
            
        $display("the value of array1 is %p", array1);
        $display("the value of array2 is %p", array2);
        $display("the value of array3 is %p", array3);

        $display("\n");


        //displaying single dimension using foreach loop
        foreach(array1[i])
                 $display("the value of array1[%0d] is %0d",i, array1[i]);

        $display("\n");

                //displaying single dimension using foreach loop
        foreach(array2[i])
                 $display("the value of array2[%0d] is %0d",i, array2[i]);

         $display("\n");

        //displaying multi dimension using foreach loop
        foreach(array3[i,j])
                $display("the value of array[%0d][%0d] = %0d" , i,j,array3[i][j]);

         $display("\n");



        //packed arrays

        //assigning elements of the packed array

        list[0] = 15;
        list[1] = 20;
        list[2] = 25;

        //assigning indexes of elements of packed array
        list[3][2] = 1;

        foreach(list[i])
            $display("the value of list[%0d] is %0d",i, list[i]);

        list2 [4][2] = 5;
        list2 [5][2] = 1;

        foreach(list2[i])
            $display("the value of list2[%0d] is %0b",i, list2[i]);



    end


endmodule