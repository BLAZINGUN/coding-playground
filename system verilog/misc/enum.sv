module top;


//starts with 0
//A name without a value is automatically assigned an increment of the value of the previous name.

000
100


enum {red , blue , white , green , black } colors;
// here all have incremental values

bit  [2:0] a; a takes 0-7

colors new_color ;

enum { yellow = 2 , grey , purple = 5 , violet} new_colors;
//yellow gets 2 and grey gets 3
//purple gets 5 and violet gets 6

//enum using typedef
typedef enum  { good,bad } packet_type;


packet_type pkt_a;
packet_type pkt_b;



initial 

    begin

        //enum colors
        //built-in enum methods

        $display("the first element in colors is %s", colors.first() );
        $display("the last element in colors is  %s", colors.last() );
        $display("the next element in colors is  %s", colors.next() );
        $display("the next 2nd element in colors is  %s", colors.next(2) );
        $display("the prev element in colors is  %s", colors.prev() );
        $display("the previous 2nd element in colors is  %s", colors.prev(2) );
        $display("the number of elements in colors is  %d", colors.num() );

        
        
        //printing the elements of an enum colors

        colors = colors.first();
       
        for (int i = 0; i < colors.num(); i++)
            begin
                $display ("\n\nin colors : value of %0s  is =  %0d ", colors.name , colors);
                colors = colors.next;
            end



        //printing the elements of an enum new_colors

        new_colors = new_colors.first();
       
        for (int i = 0; i < new_colors.num(); i++)
            begin
                $display ("\n\nin new_colors : value of %0s  is =  %0d ", new_colors.name , new_colors);
                new_colors = new_colors.next;
            end


        //typedef enum

        pkt_a = good;
        pkt_b = bad;
      
            if(pkt_a == good)
                $display("pkt_a is  good packet");
            else   
                $display("pkt_a is  bad  packet");

            if(pkt_b == good)
                 $display("pkt_b is  good packet");
            else   
                 $display("pkt_b is  bad  packet");

      


    end


// to check what the variable name points to 
    initial


        begin

            $display("\nthe value of colors is %d and the colors points to %s" , colors , colors.name);

        end 





endmodule