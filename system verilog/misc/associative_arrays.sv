module top;

//declaration

int a_array[*];

int a_array1[int];

string a_array2[string];

int index;



initial 

    begin

        repeat(3) 
            begin
                a_array[index] = index*2;
                index=index+4;
            end

        a_array1[2] = 20;
        a_array1[4] = 62;
        a_array1[5] = 35;
        a_array1[7] = 5;

        a_array2["color1"] = "red";
        a_array2["color2"] = "green";
        a_array2["color3"] = "yellow";
        a_array2["color4"] = "blue";


        //methods

        $display("the number of value in a_array is %d" , a_array.num());

        if(a_array1.exists(7))

            $display("entry exists , and its value is : %0d",a_array1[7]);

        a_array1.first(index);
        $display("the first entry is a_array[%0d] = %0d ", index,a_array1[index]);

        a_array1.last(index);
        $display("the last entry is a_array[%0d] = %0d ", index,a_array1[index]);

        a_array1.prev(index);
        $display("the previous entry is a_array[%0d] = %0d ", index,a_array1[index]);

        a_array1.next(index);
                $display("the next entry is a_array[%0d] = %0d ", index,a_array1[index]);
        

        $display("the size of the array is %0d",a_array1.size());
        a_array1.delete();
        $display("the size of the array is %0d",a_array1.size());



    end


endmodule