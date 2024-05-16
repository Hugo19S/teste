module mergeSort
    
    export merge_Sort

    function sorted(half_array) #ordena as duas metades do array principal

        for _ in 1:lastindex(half_array)

            for j in 1:lastindex(half_array)-1
                if half_array[j] > half_array[j+1]
                    half_array[j], half_array[j+1] = half_array[j+1], half_array[j]
                end
            end

        end

    end

    function merge_Sort(A, p, q, r)
        n1 = q - p + 1
        n2 = r - q

        L = zeros(1, n1 + 1) #metade esquerdo do Array
        R = zeros(1, n2 + 1)
        L[n1+1] = Inf
        R[n2+1] = Inf

        for i in 1:n1
            L[i] = A[p+i-1]
        end

        for j in 1:n2
            R[j] = A[q+j]
        end

        sorted(L)
        sorted(R)

        i, j = 1, 1

        for k in p:r
            if L[i] <= R[j]
                A[k] = L[i]
                i += 1

            else
                A[k] = R[j]
                j += 1
            end
        end
    end
end