#module Quicksort_Aleatorio


#export quicksort

function partition(A::Vector, p::Int, r::Int)
    x = A[r]
    i = p - 1

    for j in p : r-1
        if A[j] <= x
            i +=1
            A[i], A[j] = A[j], A[i]
        end
    end
    A[i+1], A[r] = A[r], A[i+1]
    return i + 1
end

function randomizedPartition(A::Vector, p::Int, r::Int)
    i = rand((p, r))

    A[i], A[r] = A[r], A[i]

    return partition(A, p, r)
end

function randomizedQuicksort(A::Vector, p::Int, r::Int)
    if p < r
        q = randomizedPartition(A, p, r)
        randomizedQuicksort(A, p, q - 1)
        randomizedQuicksort(A, q + 1, r)
    end
end

A = rand(Float64, 50000) .* 50000

time = @elapsed randomizedQuicksort(A, 1, length(A))
println(time)