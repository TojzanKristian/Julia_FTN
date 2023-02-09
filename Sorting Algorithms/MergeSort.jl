function mergeSort1!(A)
    function merge1!(A, p, q, r)
        n₁ = q - p + 1
        n₂ = r - q
        L = zeros(n₁ + 1)
        for i = 1 : n₁
            L[i] = A[p + i - 1]
        end
        R = zeros(n₂ + 1)
        for j = 1 : n₂
            R[j] = A[q + j]
        end
        L[n₁ + 1] = Inf
        R[n₂ + 1] = Inf
        i = j = 1
        for k = p : r
            if L[i] ≤ R[j]
                A[k] = L[i]
                i += 1
            else
                A[k] = R[j]
                j += 1
            end
        end
    end

    function mergeSortStep1!(A, p, r)
        if p < r
            q = (p + r) ÷ 2
            mergeSortStep1!(A, p, q)
            mergeSortStep1!(A, q+1, r)
            merge1!(A, p, q, r)
        end
    end
    mergeSortStep1!(A, 1, length(A))
end


function mergeSort2!(A)
    function merge2!(A, p, q, r)
        L = [ A[p : q]; Inf]
        R = [ A[q+1 : r]; Inf]
        
        i = j = 1
        for k = p : r
            if L[i] ≤ R[j]
                A[k] = L[i]
                i += 1
            else
                A[k] = R[j]
                j += 1
            end
        end
    end
    
    function mergeSortStep2!(A, p, r)
        if p < r
            q = (p + r) ÷ 2
            mergeSortStep2!(A, p, q)
            mergeSortStep2!(A, q+1, r)
            merge2!(A, p, q, r)
        end
    end
    mergeSortStep2!(A, 1, length(A))
end