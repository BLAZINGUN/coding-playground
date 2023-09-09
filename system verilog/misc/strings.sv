module top;

//declaration examples

string name = "ironman";

string movie_name = "AVENGERS";

string message = {"hello" , name};

bit [3:0] ab = 12;

string value = string'(ab);

string str;


task disp(string s);

    $display("at time t=%0t , %s ", $time , s );

endtask

initial 

    begin

        //$cast(value,ab);
       $display("the value of name is %s:", name ); 
       $display("the value of message is %s:", message ); 
       $display("the value of ab is %d:", ab ); 

        //lowercase
        str = movie_name.tolower();
               $display("the value of str is %s:", str ); 
            
        //uppercase
         str = movie_name.toupper();
            $display("the value of str is %s:", str );

        //replacing
        str.putc(2,"_");
            $display("the value of str is %s:", str );

        //length 
            $display("the length of str is %d:", str.len() );

        //concatenation
        str = {name , " in ",movie_name};
                    $display("the value of str is %s:", str );

        //replication
        str = {3{name}};
                    $display("the value of str is %s:", str );

        //using $sformatf
                    disp($sformatf("the movie name is %s", name));

        //getc
            $display("the character in 5th position of str is %s:", str.getc(5) );

            $display("the value of str after getcis %s:", str);


        //index
             $display("the character in 5th position of str is %s:", str[5] );


                            $display("the value of str is %s:", str );

        str[2] = "";
                            $display("the value of str is %s:", str );


    end



endmodule