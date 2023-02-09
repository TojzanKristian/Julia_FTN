function insertionSort!(A)
    for j = 2:length(A)
        key = A[j]
        i = j-1
        while i > 0 && key < A[i] 
            A[i+1] = A[i]
            i -= 1
        end
        A[i+1] = key
    end
end