# RABIN-KARP ALGORITHM FOR STRING MATCHING

# running time of the algorithm is O(N+M), but its worst-case time is O(N*M)
# vreme izvršavanja algoritma je O(N+M), ali njegovo najgore vreme je O(N*M)
# az algoritmus végrehajtási ideje O(N+M), de a legrosszabb esetben O(N*M)

function rabinKarp(t, p)
    function candidate(t, p, s, m)
        for k = 1 : m
            if p[k] != t[s+k-1]
                return false;
            end
        end
        return true;
    end

    r = [];
    d = 256;
    q = 1193;
    n, m = length(t), length(p);
    h = mod(d^(m-1), q);
    hP = 0;
    hT = 0;
    for i = 1 : m
        hP = mod(d*hP + Int(p[i]), q);
        hT = mod(d*hT + Int(t[i]), q);
    end
    for s = 1 : n-m+1
        if hP == hT
            if candidate(t,p,s,m)
                push!(r, s);
            end
        elseif s <= n-m
            hT = mod(d*(hT - Int(t[s])*h) + Int(t[s+m]), q);
        end
    end
    return r;
end