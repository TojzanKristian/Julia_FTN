# BRUTE FORCE ALGORITHM FOR STRING MATCHING

# time complexity: O(M*N)
# vremenska složenost: O(M*N)
# az idő összetettsége: O(M*N)

function bruteForce(t, p)
    r = [];
    n, m = length(t), length(p);
    for i = 1 : n-m
        for j = 1 : m
            if t[i+j] != p[j]
                break;
            elseif j == m
                push!(r, i+1);
            end
        end
    end
    return r;
end