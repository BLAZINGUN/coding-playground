num = int(input("enter a number : "))

fact = 1

if num<0:
    print("factorial does not exist")
elif num == 0:
    print("factorial of 0 is ",1)
elif num>0:
    for i in range (1,num+1):
        fact = fact * i
        
print("the factorial of the given number is  " , fact)
