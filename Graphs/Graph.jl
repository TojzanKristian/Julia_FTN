# GRAPH

# include required files  poziv potrebnih fajlova (szükséges fájlok importálása):
include("BreadthFirstSearch.jl");
include("DepthFirstSearch.jl");
include("DirectedAcyclicGraph.jl");
include("Bellman–Ford.jl");
include("Dijkstra.jl");
include("Floyd–Warshall.jl");
include("ComputingShortestDistances.jl");

# node display colors  boje za prikaz čvorova (szinek a csomók szinezéséhez):
const WHITE = 1; # bela (fehér)
const GREY = 2; # siva (szürke)
const BLACK = 3; # crna (fekete)

# structure for node graph  struktura za čvor grafa (struktúra ami a gráf csomóját imitálja):
mutable struct GNode
    key :: Int64
    color :: Int8
    previous :: Union{Nothing, GNode}
    distance :: Float64
    time :: Float64
    neighbors :: Array{GNode, 1}    
end

# node initialization  inicijalizacija čvora (csomó inicializálása):
GNode(k::Int64) = GNode(k, WHITE, nothing, Inf, Inf, []);

# structure for graph  struktura za graf (struktúra ami gráfot imitálja):
mutable struct Graph
    V :: Dict{Int32, GNode}
    w :: Dict{Tuple{Int32, Int32}, Float64}
end

# graph initialization  inicijalizacija grafa (gráf inicializálása):
Graph() = Graph(Dict{Int32,GNode}(), Dict{Tuple{Int32,Int32}, Float64}());

# add links to the graph  dodavanje veza u graf (a csomók közötti kapcsolat hozzáadása):
function AddLinks!(G, links, directedLinks=true)
    for (u, v) in links
        nodeU = get!(G.V, u, GNode(u))
        nodeV = get!(G.V, v, GNode(v))

        push!(nodeU.neighbors, nodeV)
        if !directedLinks
            push!(nodeV.neighbors, nodeU)
        end
    end
end

# adding weight to graph nodes  dodavanje težine čvorovima grafa (a gráf csomóinak súlyának/értékének hozzáadása):
function AddLinksWeights!(G::Graph, links, directedLinks=true)
    for (u, v, w) in links
        nodeU = get!(G.V, u, GNode(u))
        nodeV = get!(G.V, v, GNode(v))

        push!(nodeU.neighbors, nodeV)
        G.w[(u,v)] = w
        if !directedLinks
            push!(nodeV.neighbors, nodeU)
            G.w[(v,u)] = w
        end
    end
end

# the weight of the graph  težina grafa (a gráf csomóinak súlya/értéke):
function Weight(G::Graph, u::GNode, v::GNode)
    return G.w[(u.key, v.key)]
end

# drawing a graph  nacrtanj grafa (gráf rajzolása):
using Plots;

function draw(g, coordinates, showBothTimes=false, showWeights=false; showBranches=true, showTree=true, text)
    function node(c)
        R = 0.2;
        alfa = LinRange(0, 2*pi, 36);
        c[1] .+ R .* cos.(alfa), c[2] .+ R .* sin.(alfa);
    end
    
    function link(uc,vc)
        if uc == vc
            R = 0.2;
            beta = pi/12;
            A = [uc...];
            alfa = pi/4;
            a = alfa;
            C = A + R * [cos(a), sin(a)];
            a = alfa - beta;
            D = C + R * [cos(a), sin(a)];
            a = alfa + beta;
            E = C + R * [cos(a), sin(a)];
            a = LinRange(-pi+alfa, pi-alfa, 36);
            c = A + [R*sqrt(2), 0];
            append!(c[1] .+ R .* cos.(a), [NaN, D[1], C[1], E[1]]),
            append!(c[2] .+ R .* sin.(a), [NaN, D[2], C[2], E[2]])
        else
            R = 0.2;
            beta = pi/12;
            A = [uc...]; B = [vc...];
            alfa = atan(B[2]-A[2], B[1]-A[1]);
            a = alfa + pi - beta;
            C = B + R * [cos(a), sin(a)];
            a = alfa + pi - beta;
            D = C + R * [cos(a), sin(a)];
            a = alfa + pi + beta;
            E = C + R * [cos(a), sin(a)];
            a = alfa + beta;
            F = A + R * [cos(a), sin(a)];
            [F[1], C[1], NaN, D[1], C[1], E[1]], [F[2], C[2], NaN, D[2], C[2], E[2]];
        end
    end
    
    h = plot(title=text, showaxis=false, grid=false, legend=false, aspect_ratio=:equal)
    R = 0.2;

    if showTree # prikaži stablo (a fa kirajzolása)
        for (id, u) in g.V
            cC = coordinates[id]
            if u.previous != nothing
                kC = coordinates[u.previous.key]
                plot!([cC[1], kC[1]], [cC[2], kC[2]], lw=4, c=:gray, lc=:gray)
            end
        end
    end

    if showBranches # prikaži grane (az ágak kirajzolása)
        for (id,u) in g.V
            nU = coordinates[id]
            for v in u.neighbors
                nV = coordinates[v.key]
                o = link(nU, nV)
                plot!(o, seriestype=[:path,], lw=1, c=:black, lc=:black )
                if showWeights  # prikaži težine (a csomók súlyának kirajzolása)
                    s = string(Weight(g, u, v))
                    annotate!([( o[1][end-2], o[2][end-2], Plots.text(s, 10, :black, o[1][end-2] < o[1][end] ? :right : :left))])
                end
            end
        end
    end
    # show nodes  prikaži čvorove (a csomók kirajzolása):
    for (id, u) in g.V
        b = (u.color == WHITE) ? :white : (u.color == GREY) ? RGB(0.8,0.8,0.8) : RGB(0.4,0.4,0.4);
        k = coordinates[id]
        plot!(node(k), seriestype=[:shape,], lw=1, c=b, lc=:black, fillalpha=1 )
        annotate!([(k[1], k[2], Plots.text(string(id), 10, :red, :center, :bottom))])
        s = (showBothTimes) ? string(u.distance) * " / " * string(u.time) : string(u.distance)
        annotate!([(k[1], k[2], Plots.text(s, 10, :blue, :center, :top))])
    end
    display(h)
end

# EXAMPLES

# example 1:    - plain graph view  običan prikaz grafa (csak a gráf kirajzolása):
g = Graph();
links = ((1,2), (2,7), (3,4), (4,7), (7,6), (7,8), (5,6), (8,9), (6,11), (9,11), (9,12), (10,11), (10,12), (11,13), (12,13));
AddLinks!(g, links);
coordinates = Dict(
                1 => (3,8),
                2 => (3,7),
                3 => (5,8),
                4 => (5,7),
                5 => (1,6),
                6 => (2,5),
                7 => (4,6),
                8 => (4,5),
                9 => (4,4),
                10 => (4,3),
                11 => (2,2),
                12 => (5,2),
                13 => (3,1) );

draw(g, coordinates, text = "Example 1")


# example 2:    - plain graph view  običan prikaz grafa (csak a gráf kirajzolása):
g = Graph();
g = Graph();
links = ((1,2),(1,5),(2,6),(3,6),(3,4),(3,7),(4,7),(4,8),(6,7),(7,8));
AddLinks!(g, links, false);
coordinates = Dict(
                1 => (1,2),
                2 => (2,2),
                3 => (3,2),
                4 => (4,2),
                5 => (1,1),
                6 => (2,1),
                7 => (3,1),
                8 => (4,1) );

draw(g, coordinates, text = "Example 2")


# example 3:    - graph display with the use of BFS  prikaz grafa uz primenu BFS (gráf kirajzolása BFS algoritmus után):
g = Graph();
links = ((1,2),(1,5),(2,6),(3,6),(3,4),(3,7),(4,7),(4,8),(6,7),(7,8));
AddLinks!(g, links, false);
coordinates = Dict(
                1 => (1,2),
                2 => (2,2),
                3 => (3,2),
                4 => (4,2),
                5 => (1,1),
                6 => (2,1),
                7 => (3,1),
                8 => (4,1) );
BFS!(g, 2)
draw(g, coordinates, text = "BFS")


# example 4:    - graph display with the use of DFS  prikaz grafa uz primenu DFS (gráf kirajzolása DFS algoritmus után):
g = Graph();
links = ((1,2),(1,4),(2,5),(3,5),(3,6),(4,2),(5,4),(6,6));
AddLinks!(g, links);
coordinates = Dict(
                1 => (1,2),
                2 => (2,2),
                3 => (3,2),
                4 => (1,1),
                5 => (2,1),
                6 => (3,1) );

DFS!(g)
draw(g, coordinates, true, text = "DFS")


# example 5:    - graph display with the use of DAG  prikaz grafa uz primenu DAG (gráf kirajzolása DAG algoritmus után):
g = Graph();
links = ((1,2,5), (1,3,3), (2,3,2), (2,4,6), (3,4,7), (3,5,4), (3,6,2), (4,5,-1), (4,6,1), (5,6,-2));
AddLinksWeights!(g, links);
coordinates = Dict(
                1 => (1,0),
                2 => (2,1),
                3 => (3,0),
                4 => (3.5,2),
                5 => (4,1),
                6 => (5,1.01) );

DAG!(g,Int32(2))
draw(g, coordinates, false, true, text = "DAG")


# example 6:    - graph display before and after use of BellmanFord  prikaz grafa pre i posle primene BellmanFord (gráf kirajzolása BellmanFord algoritmus előtt és után):
g = Graph();
links = ((1,2,6), (1,4,7), (2,4,8), (2,3,5), (2,5,-4), (3,2,-2), (4,3,-3), (4,5,9), (5,1,2), (5,3,7));
AddLinksWeights!(g, links);
draw(g, coordinates, false, true, text = "Before Bellman-Ford")
uspeo = BellmanFord!(g, Int32(1))
draw(g, coordinates, false, true, text = "After Bellman-Ford")


# example 7:   - graph display before and after use of Dijkstra  prikaz grafa pre i posle primene Dijkstra (gráf kirajzolása Dijkstra algoritmus előtt és után): 
g = Graph();
links = ((1,2,10), (1,4,5), (2,4,2), (2,3,1), (3,5,4), (4,2,3), (4,3,9), (4,5,2), (5,1,7), (5,3,6));
AddLinksWeights!(g, links);
draw(g, coordinates, false, true, text = "Before Dijkstra")
Dijkstra!(g, Int32(1))
draw(g, coordinates, false, true, text = "After Dijkstra")


# example 8:    - application of FloydWarshall  primena FloydWarshall algoritma (a FloydWarshall algoritmus használata):
g = Graph();
W = [0   3   8   Inf -4
     Inf 0   Inf 1   7
     Inf 4   0   Inf Inf 
     2   Inf -5  0   Inf
     Inf Inf Inf 6   0];
AddLinksMatricesWeight!(g, W)
coordinates = Dict(
                1 => (1,2),
                2 => (3,3),
                3 => (5,2),
                4 => (4,0),
                5 => (2,0) );
draw(g, coordinates, false, true, text = "Example 8")
println("Floyd-Warshall algorithm solve:");
FloydWarshall(W);
println();


# example 9:    - apply the shortest path computing functions  primena funkcija za računanje najkraće putanje (a legrövidebb útvonalú számítási funkciók alkalmazás):
W = [0   Inf Inf Inf -1  Inf
     1   0   Inf 2   Inf Inf
     Inf 2   0   Inf Inf -8
     -4  Inf Inf 0   3   Inf
     Inf 7   Inf Inf 0   Inf
     Inf 5   10  Inf Inf 0  ];

println("Example 9:");
lSlow = slowComputingShortestDistances(W);
println("Algorithm Slow Computing Shortest Distances:");
println(lSlow);
println();
lFaster = fasterComputingShortestDistances(W);
println("Algorithm Faster Computing Shortest Distances:");
println(lFaster);
println();


# example 10:   - apply the shortest path computing functions  primena funkcija za računanje najkraće putanje (a legrövidebb útvonalú számítási funkciók alkalmazás):
W1 = [0   3   8   Inf -4
     Inf 0   Inf 1   7
     Inf 4   0   Inf Inf 
     2   Inf -5  0   Inf
     Inf Inf Inf 6   0];

println("Example 10:");
l1 = slowComputingShortestDistances(W1);
println("Algorithm Slow Computing Shortest Distances:");
println(l1);
println();
l2 = fasterComputingShortestDistances(W1);
println("Algorithm Faster Computing Shortest Distances:");
println(l2);
println();