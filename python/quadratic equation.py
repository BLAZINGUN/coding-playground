#quadratic equation is ax**2+bx+c
#a,b,c are real numbers
#a != 0


import cmath

a = int(input("enter a number(a! = 0) : "))
b = int(input("enter a number(b) : "))
c = int(input("enter a number : "))

#formula for discriminant

d = (b**2) - (4*a*c)

root1 = (-b - cmath.sqrt(d))/(2*a)
root2 = (-b + cmath.sqrt(d))/(2*a)

print ("the roots are " , root1 , "and" , root2)





