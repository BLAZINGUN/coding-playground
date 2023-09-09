//this is only for perfect squares
//I have used the repeated subtraction method


module square_root;

int number = 25;
int odd=1,count,temp;

initial 
  begin
    temp = number;
    while(temp>0)
      begin
        count++;
        temp = temp-odd;
        odd = odd+2;
      end 
    $display("the square root of the given number %0d is %0d",number,count);
  end

endmodule