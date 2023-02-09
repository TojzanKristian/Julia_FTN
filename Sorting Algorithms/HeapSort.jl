function heapSort!(A)
    parent(i) = i ÷ 2
    left(i) = 2i
    right(i) = 2i + 1

    function maxHeapify(A, n, i)
        l = left(i)
        r = right(i)
        largest = (l ≤ n && A[l] > A[i]) ? l : i
        if r ≤ n && A[r] > A[largest]
            largest = r
        end
        if largest ≠ i
            A[i], A[largest] = A[largest], A[i]
            maxHeapify(A, n, largest)
        end
    end

    function buildMaxHeap(A, n)
        for i = (n÷2):-1:1
            maxHeapify(A, n, i)
        end
    end

    n = length(A)
    buildMaxHeap(A, n)    
    for i = n:-1:2
        A[1], A[i] = A[i], A[1]
        n -= 1
        maxHeapify(A, n, 1)
    end
end