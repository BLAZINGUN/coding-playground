#program to find numbers divisible by another number

num = int(input("enter a number : "))

for i in range (1,100):
    if i % num == 0:
        print(i)



# using lambda and filter()

l = [39,48,26,33,87]
result = list(filter(lambda x : x%13 == 0,l))