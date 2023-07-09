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
    for j in range(len(b[0])):
        for k in range(len(b)):
            result[i][j] = result[i][j] + (a[i][k] * b[k][j])

for i in result:
    print(i)