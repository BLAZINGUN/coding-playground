module fibonacci;

typedef struct{int array[];} a;

int array1[];
int number = 8;

function automatic a f(input int number);

    int array2[];

    if(number == 0)
      	begin
            array2 = new[number];
            array2[0] = 0;
          end
    else if(number == 1)
        begin
            array2 = new[number];
            array2[0] = 0;
            array2[1] = 1;
        end
    else
        begin
            array2 = new[number];
            array2[0] = 0;
            array2[1] = 1;
            for(int i = 2; i<number; i++)
                begin
                    array2[i] = array2[i-1] + array2[i-2];
                end
        end
f.array = array2;
endfunction

initial 
    begin
      array1 = new[number];
      array1 = f(number).array;

        for(int j=0; j<number; j++)
        begin
            $display("%0d",array1[j]);
        end
    end

endmodule