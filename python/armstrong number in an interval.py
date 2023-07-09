lower_limit  = int(input("enter lower limit : "))
upper_limit  = int(input("enter upper limit : "))

sum = 0

for i in range (lower_limit , upper_limit+1)
    order = len(str(num))
    sum = 0
    temp = num
    while temp > 0:
        digit = temp%10
        sum = sum + (digit ** order)
        temp = temp // 10
    if num == sum:
        print(num)