module inserction
    export insertion_sort

    function insertion_sort(A)
        for j = 2: lastindex(A) 
            key = A[j]
            i = j - 1

            while i > 0 && A[i] > key
                A[i+1] = A[i]
                i = i - 1
            end

            A[i+1] = key
        end
    end
end