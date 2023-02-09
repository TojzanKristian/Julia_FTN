function quickSort!(A, randomized=false)
    function divide!(A, p, r)
        if randomized && r - p > 3
            k = rand(p:r)
            A[k], A[r] = A[r], A[k]
        end
        x = A[r]
        i = p-1
        for j = p : r-1
            if A[j] ≤ x
                i += 1
                A[i], A[j] = A[j], A[i]
            end
        end
        A[i+1], A[r] = A[r], A[i+1]
        return i+1
    end
    
    function quickSortStep!(A, p, r)
        if p < r
            q = divide!(A, p, r)
            quickSortStep!(A, p, q-1)
            quickSortStep!(A, q+1, r)
        end
    end
    quickSortStep!(A, 1, length(A))
end