# the structure that represents the ant  struktura koja predstavlja mrava (a hangyát képviselő struktúra):
mutable struct Ant
    route :: Array{Int, 1};
    currentNodeIndex :: Int;
    fitness :: Int;
end

# function that generates a population  funkcija koja generiše populaciju (populációt generáló függvény):
function generateAntPopulation(antsCount::Int, antsStartNodeIndex::Int)
    ants::Array{Ant, 1} = [];
    for i in 1:antsCount
        push!(ants, Ant([], antsStartNodeIndex, 0));
    end
    return ants;
end