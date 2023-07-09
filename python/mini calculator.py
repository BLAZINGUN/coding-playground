num1 = int(input("enter a number : "))
num2  = int(input("enter another number : "))

mode = int(input("enter \n 1 for addition , 2 for subtraction , 3 for multiplication , 4 for division "))


if mode == 0:
    print ("addition of ", num1 ," and ", num2 , " is :",  num1+num2)

elif mode == 1:
    print ("subtraction of ", num1 ," and ", num2 , " is :",  num1-num2)
    
elif mode == 2:
    print ("multiplication of ", num1 ," and ", num2 , " is :",  num1*num2)
    
elif mode == 3:
    print ("division of ", num1 ," and ", num2 , " is :",  num1//num2)
    