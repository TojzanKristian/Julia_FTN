function countingSort(A, B, k)
    C = zeros(Int64, k);
    for i in 1:length(A)
        C[A[i]] += 1;
    end
	
    for j = 2:length(C)
        C[j] += C[j-1];
    end

    n = length(A);
    B = zeros(typeof(A[1]), n);
    for k = 1:n
        B[C[A[k]]] = A[k];
        C[A[k]] -= 1;
    end
    return B;
end