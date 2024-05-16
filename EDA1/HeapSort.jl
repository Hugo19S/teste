module Heap

    export heapSort

    function Left(i)
        return Int(2*i)
    end

    function Rigth(i)
        return Int(2*i + 1)
    end

    function maxHeapify(A, i, heapSize)
        
        l = Left(i)
        r = Rigth(i)
        largest = if l <= heapSize && A[l] > A[i]
            l else i end
        
        if r <= heapSize && A[r] > A[largest]
            largest = r
        end

        if largest != i
            A[i], A[largest] = A[largest], A[i]
            maxHeapify(A, largest, heapSize)
        end
    end

    function buildMaxHeap(A, heapSize)
        for i in floor(length(A)/2):-1:1

            maxHeapify(A, Int(i), heapSize)
        end
    end

    function heapSort(A)
        
        heapSize = length(A)
        buildMaxHeap(A, heapSize)
        
        for i in length(A):-1:2
            A[1], A[i] = A[i], A[1]
            heapSize = heapSize-1
            maxHeapify(A, 1, heapSize)
        end
    end

end