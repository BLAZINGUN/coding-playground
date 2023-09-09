module mirror_number;

int number = 123321;  
int a,a_temp,order_count; //variables for order function
int ord,ord_temp,half,count,temp;//variables to find if it is a mirror number or not
bit[3:0] store[]; //dynamic array to store each digit
bit[3:0] remainder; //variable to store the remainder 

function automatic integer order(input integer a);   
    a_temp = a;
    while(a_temp >= 1)
        begin
            order_count = order_count + 1'b1;
            a_temp = a_temp/10;
        end
    order = order_count;
endfunction

initial
    begin
      ord = order(number);
      store = new[ord];
      ord_temp = number;

      for(integer i = 0 ; i< ord; i++)
        begin
            remainder = ord_temp%10;             
            store[i] = remainder;
            ord_temp = ord_temp/10;
        end
      
      if(ord%2 == 0)
        begin
            half = ord/2;
          	temp = ord-1;
            for(int i=0; i<half; i++)
                begin
                    if(store[i] == store[temp]) begin
                        count++; end
                    temp--;
                end
        end
      
      else if (ord%2 == 1)
        begin
            half = (ord-1)/2;
            temp = ord-1;
            for(int i=0; i<half; i++)
                begin
                    if(store[i] == store[temp]) begin
                        count++; end
                    temp--;
                end          
        end
      
        if(count == half)
            $display("the given number %0d is a mirror number",number);
        else
            $display("the given number %0d is not a mirror number",number);    
    end
endmodule