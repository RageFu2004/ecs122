def mergesort(lst, start, end):
    if end - start == 1:
        if lst[start] > lst[end]:
            return [lst[end], lst[start]]
        else:
            return [lst[start], lst[end]]
    ret = []
    a = mergesort(lst, start, (start+end)//2)
    b = mergesort(lst, (start+end)//2+1, end)
    while a or b:
        if not a:
            for i in range(len(b)):
                ret.append(b.pop(0))
            break
        if not b:
            for i in range(len(a)):
                ret.append(a.pop(0))
            break
        if a[0] > b[0]:
            ret.append(b.pop(0))
        else:
            ret.append(a.pop(0))
    return ret

def insert_sort_recur(lst):
    n = len(lst)
    if n == 2:
        return [min(lst), max(lst)]
    ret = insert_sort_recur(lst[0:n-1])
    if lst[n-1] > ret[-1]:
        ret.append(lst[n-1])
        return ret
    else:
        ret.append(lst[n-1])
        i = n-2
        temp = ret[n-1]
        while ret[i] > temp and i >= 0:
            ret[i+1] = ret[i]
            i -= 1
        ret[i+1] = temp
        return ret

print(insert_sort_recur([2,3,1,5,7,9,10,4]))

def dnc_compare(lst, low, high):
    print(lst)
    if high - low == 1:
        return min(lst), max(lst)
    mid = (low+high)//2
    print('mid', mid)
    min1, max1 = dnc_compare(lst[low: mid+1], low, mid)
    min2, max2 = dnc_compare(lst[mid+1: high+1], mid+1, high)
    return min([min1, min2]), max([max1, max2])

print(dnc_compare([1,2,3,4],0, 3))

def find_i(lst, low, high):
    if low > high:
        return False
    mid = (low+high)//2
    if lst[mid] == mid:
        return mid
    elif lst[mid] > mid:
        return find_i(lst, low, mid-1)
    else:
        return find_i(lst, mid+1, high)
print(find_i([-5,0,2,5], 0, 3))
