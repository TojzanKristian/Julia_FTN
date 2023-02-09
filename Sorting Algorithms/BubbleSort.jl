function bubblesort!(A)
    n = length(A)
 
    for i=1:n, j=1:n-i
        if (A[j] > A[j+1])
            A[j], A[j+1] = A[j+1], A[j]
        end
    end
end
