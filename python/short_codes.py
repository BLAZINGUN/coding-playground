"""

#1*****************************************************************
marks = 80

if marks == 90 or marks == 80 or marks ==95:
    print ("good job")

#short form

if marks in [80,90,95]:
    print("good job")

#*****************************************************************





#2*****************************************************************
marks = 80

if marks >90:
    print("excellent work")
else :
    print("good job")


#short form

print("excellent work") if marks > 90 else print("good job")

#*****************************************************************





#3*****************************************************************
l = [50,30,20,60,20,40]

a = []

for i in l:
    a.append(i*2)
print (a)

#short form

x = [i*2 for i in l]
print (a)

#*****************************************************************





#4*****************************************************************
l = [10,20,40,30,50]

index = 0

for i in l:
    print (index,i)
    index += 1

#short form

for i in enumerate(l):
    print (i)

#*****************************************************************

"""

#5*****************************************************************
#using seperators for easy reading of numbers

num1 = 90_00_000
num2 = 10_000

sum = (num1+num2)

print(f'{sum:,}')

#*****************************************************************



#*****************************************************************
#lambda functions

def square(x):
    return x*x

print(square(4))

#using lambda functions

a = lambda b : b**2
print(a(4))

#*****************************************************************


#*****************************************************************
#zip function

print ("ram has scored 90 marks in math")
print ("sita has scored 85 marks in art")
print ("krishna has scored 100 marks in biology")
print ("radha has scored 95 marks in physics")


#using zip function

names = ["ram","sita","krishna","radha"]
marks = [90,85,100,95]
subjects = ["math","art","biology","physics"]

for name,mark,subject in zip(names,marks,subjects):
    print(name,"has scored",mark,"marks in",subject)
#*****************************************************************


#*****************************************************************

# id,password
USERNAME = madhav
PASSWORD = madhav123

username = input("enter username : ")
password = input("enter password : ")

if ((username == USERNAME) and (password == PASSWORD))
    print("login successful")



#if we want to hide password from display use getpass module

from getpass import getpass

username = input("enter username : ")
password = getpass("enter password :")

if ((username == USERNAME) and (password == PASSWORD))
    print("login successful")


#*****************************************************************



#*****************************************************************
#to get unique values from a list 

l = [10,30,20,40,30,40,60,40,50,30,20]

print (l)

#convert it to a set to remove repeated items

my_set = set(l)

my_list = list(my_set)
print(my_list)

#*****************************************************************






#*****************************************************************
#format string with f string

name = "madhav"

print("my name is" , name)


#using f string

print(f'my name is {name}')


#*****************************************************************







#*****************************************************************

num1 = 16
num2 = 34

print("the addition of ",num1,"and",num2 "is " num1+num2)

#using f string

print(f'the addition of {num1} and {num2} is {num1+num2}')
#*****************************************************************



#11*****************************************************************

#sorting a list

l = [67,30,57,28,96,12]

sorted_list = sorted(l)
reverse_sorted_list = sorted(l,reverse=True)

print(sorted_list)
print(reverse_sorted_list)

#sorting a list of dictionary

dl = [{"name":"ram" , "marks":87},
      {"name" : "sita", "marks": 74},
      {"name" : "krishna" , "marks" : 92},
      {"name":"radha" , "marks" : 89}]

sorted_data = (sorted(dl,key = lambda x:x["marks"]))
for i in sorted_data:
    print(i)
#*****************************************************************



#*****************************************************************

#merging dictionaries

dict1 = {"name" : "ram" , "marks" : 95} 
dict2 = {"name" : "ram" , "hobbies" : fighting}

md = {**dict1,**dict2}
print(md)

#*****************************************************************






#*****************************************************************
#use .join to concatenate strings

l = ["welcome", "to", "python"]

a = ""

for i in l:
    a+= i+" "
print(a)


#using .join

a = " ".join(l)
print(a)

#*****************************************************************
