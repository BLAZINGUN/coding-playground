module palindrome;

bit[63:0] name = "abcddcba";
bit[0:31] s ;
int j = 63;

initial
    begin
      for (int i = 0; i<32; i++)
        begin
          s[i] = name[j];
          j = j-1;
        end
      
        if(s[0:31] == name[63:32])
        	$display("The given name %s is a palindrome",name);
        else
            $display("The given name %s is not a palindrome",name);
    end

endmodule