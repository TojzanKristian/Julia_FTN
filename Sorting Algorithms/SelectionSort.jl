function selectionSort!(A)
    for i = 1:length(A)-1
        indMin = i
        for j = i+1 : length(A)
            if A[j] < A[indMin]
                indMin = j
            end
        end
        A[i], A[indMin] = A[indMin], A[i]
    end
end