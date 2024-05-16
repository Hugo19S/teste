module buble
    export bubble_sort

    function bubble_sort(A)
        for i = 1: length(A) - 1
            for j = length(A) :-1 :(i + 1) 
                if A[j] < A[j-1]
                    A[j], A[j-1] = A[j-1], A[j]
                end
            end
        end
    end
end