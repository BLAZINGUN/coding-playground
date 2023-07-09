dict1 = {"john" : 89, "lisa" : 99}
dict2 = {"lisa" : 94, "peter" : 78}

dict3 = dict2.copy
dict3.update(dict1)

print(dict3)