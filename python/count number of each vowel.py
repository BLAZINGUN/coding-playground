a = "Harry Potter And The Prisoner Of Azkaban"

vowels = "aeiou"

a = a.casefold()

print(a)
count = {}.fromkeys(vowels,0)
print(count)

for char in a :
    if char in count:
        count[char] = count[char] + 1

print(count)


"""
another way 

count = {key:sum([1 for char in a if char == key])for key in vowels}
print(count)
"""