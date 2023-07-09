num = int(input("enter a number : "))

if num == 1:
    print("it is not a prime number")

elif num > 1:
    for i in range (2,num):
        if num % i == 0:
            print (" it is not a prime")
            break
    else :
        print(num," is a prime number")