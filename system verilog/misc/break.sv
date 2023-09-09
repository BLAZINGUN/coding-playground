//break
//the execution of a break statement leads to the end of the loop

//break in while loop

module break_ex;

    int i;

    initial 
        begin
            
            i = 8;

            while (i!=0)
                begin
                    $display("\t value of i = %0d",i);
                    
                    if(i==4)
                        begin
                        $display("calling break");
                        break;
                        end
                    i--;
                end



        end

endmodule


//break inside a foreach loop

module break_ex2;

int a[4];

initial 
    begin

        foreach(a[i]) 
            a[i] = i;
        
        foreach(a[i])
            begin

                $display("value of a[%0d] = %0d",i,a[i]);
                if(i==2)
                    begin
                        $display("calling break");
                        break;
                    end
            end
    end

endmodule


//break in for loop

module break_in_loop;

  initial begin
    $display("-----------------------------------------------------------------"); 

    for(int i=0;i<8;i++) begin
      $display("\tValue of i=%0d",i);
      if(i == 4) begin
        $display("\tCalling break,");
        break;
      end 
    end  

    $display("-----------------------------------------------------------------");
  end

endmodule




//break in repeat loop

module repeat_loop_break;
  int i;
  
  initial begin
    $display("-----------------------------------------------------------------");
    repeat(5) begin
      $display("\tValue of i=%0d",i);
      if(i == 2) begin
        $display("\tCalling break,");
        break;
      end
      i++;
    end      
    
    $display("-----------------------------------------------------------------");
  end     
endmodule




//break in forever loop

module forever_loop_break;
  int i;
  
  initial begin
    $display("-----------------------------------------------------------------");
    i = 5;
    forever begin
      $display("\tValue of i=%0d",i);
      if(i == 2) begin
        $display("\tCalling break,");
        break;
      end
      i++;
    end      
    
    $display("-----------------------------------------------------------------");
  end     
endmodule