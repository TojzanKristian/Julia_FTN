# the structure that represents the graph  struktura koja predstavlja graf (a gráfot ábrázoló struktúra):
mutable struct Graph
    adjMatrix :: Array{Int, 2};
    pheromoneMatrix :: Array{Float64, 2};
    nodesCount :: Int;
end

# the function that generates the graph  funkcija koja generiše graf (a gráfot generáló függvény):
function generateGraph(nodesCount::Int, adjMatrix::Array{Int, 2})
    pheromoneMatrix = ones(Float64, (nodesCount, nodesCount));
    graph = Graph(adjMatrix, pheromoneMatrix , nodesCount);
    return graph;
end