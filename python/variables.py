x = 'python '
y = 'is '
z = 'awesome '

print(x,y,z)
print(x+y+z)

a = 1
b = 2.5
c = 1j

print("\n",type(a))
print(type(b))
print(type(z))
print(type(c))


a1 = 35e3
a2 = 12E4
a3 = -87.980e100

print("\n",a1)
print(type(a1))
print(a3)
print(type(a3))
print(a2)
print(type(a2))


#complex numbers

c1 = 3+5j
c2 = -81j
c3 = 9+0j

print(c1,c2,c3)
print(type(c3))


#casting

b1 = 2.4
b2 = 3
b3 = "5"
b4 = "4"


d1 = int(b1)
d2 = int(b2)
d3 = int(b3)
d4 = b3+b4
d5 = b2 + b1

print("d4 = ",d4)
print("d5 = ",d5)
print(d1,d2,d3)


#multiple assignment 

e1 = e2 = e3 = 5
f1,f2,f3 = 1,4,"john"

print(e1,e2,e3) 
print(f1,f2,f3)

#local variables

def sum(x,y):
    sum = x+y
    return sum

print(sum(2,4))

#global variables

p = 10
q = 13

def sum1(x,y):
    sum = x+y
    return sum

print(sum1(p,q))
