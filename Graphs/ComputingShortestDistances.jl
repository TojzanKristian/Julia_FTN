function computing(L,W)
    n = size(L, 1);
    Lp = ones(n,n) * Inf;
    for i = 1:n
        for j = 1:n
            for k = 1:n
                Lp[i,j] = min(Lp[i,j], L[i,k]+W[k,j]);
            end
        end
    end
    return Lp;
end

# algorithm for slow computing shortest distances
# algoritam za sporo računanje najkraćih rastojanja
# algoritmus a legrövidebb távolságok számítására, lassú verzió
function slowComputingShortestDistances(W)
    n = size(W, 1);
    L = copy(W);
    for m = 2 : n-1
        L = computing(L, W);
    end
    return L;
end

# algorithm for faster computing shortest distances
# algoritam koji malo brže računa najkraća rastojanja
# algoritmus a legrövidebb távolságokon számítására, kicsit gyorsabb verzió
function fasterComputingShortestDistances(W)
    n = size(W, 1);
    L = copy(W);
    m = 1;
    while m < n-1
        L = computing(L, L);
        m *= 2;
    end
    return L;
end