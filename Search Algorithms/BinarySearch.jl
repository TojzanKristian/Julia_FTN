function binarySearch(A, key)
    p = 1;
    r = length(A);   
    while p ≤ r
        q = Int(floor((p+r)/2)); 
        if A[q] == key
            return q;
        elseif A[q] < key
            r = q - 1;
        else
            p = q + 1;
        end
    end
    return -1;
end


function binarySearchR(A, key)
    function binarySearchRecursive(A, p, r, key)
        if p > r
            return -1;
        else
            q = Int(floor((p+r)/2))
            if A[q] == key
                return q;
            elseif A[q] > key
                binarySearchRecursive(A, p, q-1, key);
            else
                binarySearchRecursive(A, q+1, r, key);
            end 
        end
    end

    binarySearchRecursive(A, 1, length(A), key);
end