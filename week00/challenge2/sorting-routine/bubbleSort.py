def bubbleSort(L):
    n = len(L)
    for i in range(0,n):
        for j in range(0,n-1-i):
            if (int(L[j])>int(L[j+1])):
                L[j], L[j+1] = L[j+1], L[j]

lst = [4,3,2,5,1]
print("The original list: ")
print(lst);
'''
for val in lst:
    print(val,end=" ")
print()
'''
bubbleSort(lst)
print("The sorted list: ")
print(lst);
'''
for val in lst:
    print(val,end=" ")
print()
'''
