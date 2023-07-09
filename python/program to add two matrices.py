a = [[1,5,8],
     [2,4,5],
     [5,9,1]]

b = [[3,2,9],
     [0,8,4],
     [7,3,5]]

result = [[0,0,0],
          [0,0,0],
          [0,0,0]]
for i in range(len(a)):
    for j in range (len(a[0])):
        result[i][j] = a[i][j] + b[i][j]

for i in result:
    print(i)