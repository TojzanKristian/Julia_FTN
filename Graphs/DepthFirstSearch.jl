# DEPTH FIRST SEARCH

# pretraga u dubinu
# mélységi keresés

# algorithm implementation  implementacija (implementáció):
function DFS!(g)
    function DFSvisit!(g, u)
        time += 1;
        u.distance = time;
        u.color = GREY;
        for v in u.neighbors
            if v.color == WHITE
                v.previous = u;
                DFSvisit!(g, v);
            end
        end
        u.color = BLACK;
        time += 1;
        u.time = time;
        push!(tSort, u);
    end

    tSort = [];
    for u in values(g.V)
        u.color = WHITE;
        u.previous = nothing;
    end

    time = 0;
    for id in sort(collect(keys(g.V)))
        u = g.V[id]
        if u.color == WHITE;       
            DFSvisit!(g, u);
        end
    end
    return tSort[end:-1:1];
end