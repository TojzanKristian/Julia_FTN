# KNUTH-MORRIS-PRATT ALGORITHM FOR STRING MATCHING

# time complexity: O(N)
# vremenska složenost: O(N)
# az idő összetettsége: O(N)

function KMP(T, P)
    function specifyPrefixes(P)
        m = length(P);
        Pi = Array{Int16}(undef, m);
        Pi[1] = 0;
        k = 0;
        for q = 2 : m
            while k > 0 && P[k+1]!=P[q]
                k = Pi[k];
            end
            if P[k+1] == P[q]
                k += 1;
            end
            Pi[q] = k;
        end
        return Pi;
    end
    
    r = [];
    n = length(T);
    m = length(P);
    Pi = specifyPrefixes(P);
    q = 0;
    for i = 1 : n
        while q > 0 && P[q+1]!=T[i]
            q = Pi[q];
        end
        if P[q+1]==T[i]
            q += 1;
        end
        if q == m
            push!(r, i-m+1); 
            q = Pi[q];
        end
    end
    return r;
end