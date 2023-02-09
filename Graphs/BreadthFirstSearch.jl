# BREADTH FIRST SEARCH

# pretraga u širinu
# szélességi bejárás

# algorithm implementation  implementacija (implementáció):
function BFS!(g, s)
    for u in values(g.V)
        u.color = WHITE;
        u.distance = Inf;
        u.previous = nothing;
    end

    nodeS = g.V[s];
    nodeS.color = GREY;
    nodeS.distance = 0;

    Q = [nodeS];
    while length(Q) > 0
        u = pop!(Q)        
        for v in u.neighbors
            if v.color == WHITE
                v.color = GREY;
                v.distance = u.distance + 1;
                v.previous = u;
                push!(Q, v);
            end
        end
        u.color = BLACK;
    end
end