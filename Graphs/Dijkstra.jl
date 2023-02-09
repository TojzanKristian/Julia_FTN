# DIJKSTRA ALGORITHM

# single-source shortest path algorithm
# algoritam najkraće putanje sa jednim izvorom
# egy csomóbol induló legrövidebb útvonalat meghatározó algoritmus

# the time complexity: 𝑂(𝑉*log2𝑉+𝐸)
# vremenska složenost: 𝑂(𝑉*log2𝑉+𝐸)
# az idő összetettsége: 𝑂(𝑉*log2𝑉+𝐸)

# initialization of the initial node from which the algorithm star
# inicijalizacija početnog čvora iz kojeg algoritam kreće
# az első csomó meghatározása, ahonnan az algoritmus elindul
function initializationSource!(G, s)
    for u in values(g.V)
        u.color = WHITE;
        u.distance = Inf;
        u.previous = nothing;
    end
    s.distance = 0;
end

# edge relaxation
# relaksacija - ažuriranje troškova između čvorova
# relaxáció - a csomópontok közötti költségek frissítése
function relaxation!(G, u, v)
    w = Weight(G, u, v)
    if v.distance > u.distance + w
        v.distance = u.distance + w;
        v.previous = u;
        return true;
    end
    return false;
end

# algorithm implementation  implementacija (implementáció):
function Dijkstra!(G, skey::Int32)
    function allocateMinimum!(Q)
        D = map(id -> G.V[id].distance, Q);
        ind = argmin(D);
        id = Q[ind];
        Q[ind] = Q[end];
        pop!(Q);
        return id;
    end

    initializationSource!(G, G.V[skey])
    G.V[skey].color = GREY;
    S = [];
    Q = collect(keys(G.V));
    while length(Q) > 0
        u = G.V[allocateMinimum!(Q)];
        u.color = GREY;
        push!(S, u);
        for v in u.neighbors
            relaxation!(G, u, v);
        end
        u.color = BLACK;
    end
end