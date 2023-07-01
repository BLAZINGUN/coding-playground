#word guessing game

import random

name = input("what is your name?  ")
print ("good luck !" , name)

words = ['rainbow','computer','science','programming','python','mathematics','player','condition','reverse','water','board','geeks']

#to choose a random word from the list of words
word  = random.choice(words)

print ("guess the characters")

guesses = ''

#no of chances 
turns = 12

while turns > 0:
    failed = 0
    
    for char in word:
        if char in guesses:
            print(char,end = "")
        else:
            print("_")
            failed = failed + 1
    
    if failed == 0:
        print("you win")
        print("the correct word is : ",word)
        break
    
    print()
    guess = input("guess a character : ")
    
    guesses  = guesses+guess
    
    if guess not in word:
        turns = turns - 1
        print("wrong")
        print("you have ",turns ,"more guesses")
    
    if turns == 0:
        print("you lost")
