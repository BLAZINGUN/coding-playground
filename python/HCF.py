num1 = int(input("enter a number : "))
num2 = int(input("enter another number :"))

hcf = 0
smaller = 0

if num1 > num2 :
    smaller  = num2
else :
    smaller = num1

for i in range (1,smaller):

    if (num1 % i == 0) and (num2 % i == 0):
        hcf = i
        
print(hcf)