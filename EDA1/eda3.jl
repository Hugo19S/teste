#bubble_sort e insertion_sort de forma recursiva

function insertion_sort_recur(A, size, j = 2, i=1)
    if (size <= 1)
        return A
    end

    key = A[j]
    #i = j - 1

    if i > 0 && A[i] > key
        A[i+1] = A[i]
        i = i - 1
        insertion_sort_recur(A, size, j, i)
    end

    A[i+1] = key

    insertion_sort_recur(A, size-1, j+1, j)

end


A = [5, 8, 3, 2, 4, 1, 7, 6]

println(insertion_sort_recur(A, length(A)))