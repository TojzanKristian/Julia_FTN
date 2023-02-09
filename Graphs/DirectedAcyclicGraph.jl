# DIRECTED ACYCLIC GRAPH

# od zadatog grafa generiše acikličan graf
# a megadott gráfból aciklikus gráfot csinál

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
function DAG!(G, skey::Int32)
    topoSort = DFS!(G);
    initializationSource!(G, G.V[skey]);
    for u in topoSort
        for v in u.neighbors
            relaxation!(G, u, v);
        end
    end
end