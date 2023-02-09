# BELLMAN-FORD ALGORITHM

# single-source shortest path algorithm
# algoritam najkraće putanje sa jednim izvorom
# egy csomóbol induló legrövidebb útvonalat meghatározó algoritmus

# the time complexity: 𝑂(𝑉*𝐸)
# vremenska složenost: 𝑂(𝑉*𝐸)
# az idő összetettsége: 𝑂(𝑉*𝐸)

# initialization of the initial node from which the algorithm star
# inicijalizacija početnog čvora iz kojeg algoritam kreće
# az első csomó meghatározása ahonnan az algoritmus elindul
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
function BellmanFord!(G, skey::Int32)
    initializationSource!(G, G.V[skey])
    for i = 1 : length(G.V)-1
        for u in values(G.V)
            for v in u.neighbors
                relaxation!(G, u, v)
            end
        end
    end
    for u in values(G.V)
        for v in u.neighbors
            if relaxation!(G, u, v)
                return false;
            end
        end
    end
    return true;
end