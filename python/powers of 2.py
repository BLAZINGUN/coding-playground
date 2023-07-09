num = int(input("enter a number : "))


while num >0:
    power  = 2**num
    print(power)
    num = num-1

"""
using anonymous function

num = int(input("enter a number : ))

result = list(map(lambda x : 2**x, range(num+1)))

print(result)


for i in range (num+1):
    print("the value of 2 raised to the power" , i , "is" ,result[i])

"""


