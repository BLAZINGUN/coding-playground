import random
import math

#taking inputs 
lower = int(input("enter the lower bound : "))

#taking inputs
upper = int(input("enter the upper bound : "))

#generating the random number between the upper and lower bound
x = random.randint (lower,upper)

print ("\t you have ", round(math.log(upper-lower+1,2)) , "chances to guess the integer")

#initializing the number of guesses to zero
count = 0

#for calculating minimum number of guesses

while count < math.log(upper-lower,2)
    count = count + 1
    guess = int(input("guess a number : "))
    
    if x == guess:
        print("congratulations you did it in ", count ,"try" )
        break
    elif x > guess
        print("you guessed too small")
    elif x < guess
        print("you guessed too high")

if count > math.log(upper-lower+1,2)
    print("the number is " ,x)
    print("better luck next time")