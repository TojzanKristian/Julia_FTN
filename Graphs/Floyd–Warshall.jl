# FLOYD - WARSHALL ALGORITHM

# solving all pairs of shortest-path problem
# rešava problem svih najkraćih puteva između parova čvorova u grafu
# a legrövidebb út problémájának megoldása minden pár csomó között a gráfban

# time complexity: O(V^3)
# vremenska složenost: O(V^3)
# idő összetettsége: O(V^3)

using Printf;

# add links matrices weight  dodavanje veza matrice težina (a kapcsolatok mátrix formájában való súly hozzárendelése):
function AddLinksMatricesWeight!(G, W)
    n = size(W, 1);
    for i = 1 : n
        G.V[i] = GNode(i);
    end
    for i = 1 : n   
        nodeU = G.V[i];
        for j = 1 : n
            if i == j continue; end
            if W[i,j] != Inf
                push!(nodeU.neighbors, G.V[j]);
                G.w[(i,j)] = W[i,j];
            end
        end
    end
end

# Floyd-Warshall algorithm printing function  funkcija za ispis Floyd-Warshall algoritma (függvény a Floyd-Warshall algoritmus kiírásához):
function printFW(D, P)
    n = size(D, 1);
    for i=1:n
        for j = 1:n
            @printf("%5d", D[i,j]);
        end
        print("     ");
        for j = 1:n
            print(isnothing((P[i,j])) ? "-" : P[i,j], " ");
        end
        println();
    end
    println();
end

# algorithm implementation  implementacija (implementáció):
function FloydWarshall(W)
    n = size(W, 1);
    D = copy(W);
    P = [(i==j || W[i,j]==Inf) ? nothing : i for i=1:n, j=1:n];
    printFW(D, P);
    for k = 1:n
        for i = 1:n
            for j = 1:n
                P[i,j] = (D[i,k]+D[k,j] < D[i,j]) ? P[k,j] : P[i,j];
                D[i,j] = min(D[i,j], D[i,k]+D[k,j]);
            end
        end
        printFW(D, P);
    end
end