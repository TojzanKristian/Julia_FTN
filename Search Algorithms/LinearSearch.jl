function linearSearch(A, key)  
    for k = eachindex(A)
        if A[k] == key
            return k;
        end
    end
    return 0;
end


function linearSearchAll(A, key)
    rez = []
    for k in eachindex(A)
        if A[k] == key
            push!(rez, k);         
        end
    end 
    return rez;
end


function linearSearchWithSentinel(A, key)
    n = length(A)
    if n > 0
        last = A[n];
        A[n] = key;
        k = 1;
        while A[k] ≠ key
            k += 1;
        end
        A[n] = last;
        if (k < n) || (A[n] == key)
            return k;
        end
    end
    return 0;
end