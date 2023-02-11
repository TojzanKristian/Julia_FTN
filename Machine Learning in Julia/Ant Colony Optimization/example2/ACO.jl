using StatsBase;

include("ant.jl");
include("graph.jl");

# implementation of the algorithm  implementacija algoritma (az algoritmus megvalósítása):
function runAntColonyOptimization(graphNodes, maxIterations, antsNumber, pheromoneDepositFactor, evaporationRate, pheromoneExponent, desirabilityExponent, graph)
    bestFitness = Inf;
    bestPath = [];

    for i in 1 : maxIterations
        ants = generateAntPopulation(antsNumber, collect(1:1:graphNodes));
       
        for j in 1:antsNumber
            currentAnt = ants[j];
            antMadeTour = false;
            antStartNode = currentAnt.currentNodeIndex;
            while !antMadeTour
                possiblePaths = findPossiblePaths(currentAnt, graph);
                probabilities = calculateProbabilities(currentAnt, possiblePaths, graph, pheromoneExponent, desirabilityExponent);
                chosenNode = sample(possiblePaths, Weights(probabilities));
                push!(currentAnt.route, currentAnt.currentNodeIndex);
                currentAnt.currentNodeIndex = chosenNode;
                if chosenNode == antStartNode
                    antMadeTour = true;
                    push!(currentAnt.route, currentAnt.currentNodeIndex);
                end
            end

            fitness = calculateFitness(ants[j], graph);
            ants[j].fitness = fitness;
            if fitness < bestFitness
                bestFitness = fitness;
                bestPath = deepcopy(ants[j].route);
            end
        end

        updatePheromones!(ants, graph, pheromoneDepositFactor, evaporationRate);
    end

    return bestPath, bestFitness, graph;
end

# function that updates pheromones  funkcija koja ažurira pheromone (a feromonokat frissítő függvény):
function updatePheromones!(ants::Array{Ant, 1}, graph::Graph, pheromoneDepositFactor, evaporationRate)
    pheromoneDepositMatrix = zeros(Float64, graph.nodesCount, graph.nodesCount)

    for currentAnt in ants
        route = currentAnt.route
        for j in 1 : length(currentAnt.route) - 1;
            pheromoneDepositMatrix[route[j], route[j + 1]] += pheromoneDepositFactor / currentAnt.fitness;
        end
    end

    for i in 1:graph.nodesCount 
        for j in (i+1):graph.nodesCount
            pheromone = graph.pheromoneMatrix[i, j];
            graph.pheromoneMatrix[i, j] = (1 - evaporationRate) * pheromone +  pheromoneDepositMatrix[i, j];
            graph.pheromoneMatrix[j, i] =  graph.pheromoneMatrix[i, j];
        end
    end
end

# function that calculates probability  funkcija koja računa verovatnoću (a valószínűséget kiszámító függvény):
function calculateProbabilities(ant::Ant, possiblePaths::Array{Int, 1}, graph::Graph, pheromoneExponent, desirabilityExponent)
    pathsSum = 0;

    for possibleNode in possiblePaths
            pathsSum += ( ( (graph.pheromoneMatrix[ant.currentNodeIndex, possibleNode]) ^ pheromoneExponent ) * 
	                (1 / graph.adjMatrix[ant.currentNodeIndex, possibleNode]) ^ desirabilityExponent );
    end

    probabilities = Float64[];

    for possibleNode in possiblePaths
        push!(probabilities, ( ( (graph.pheromoneMatrix[ant.currentNodeIndex, possibleNode]) ^ pheromoneExponent ) * 
	      (1 / graph.adjMatrix[ant.currentNodeIndex, possibleNode]) ^ desirabilityExponent ) / pathsSum);
    end

    return probabilities;
end

# function to find a possible path  funkcija za nalaženje moguće putanje (függvény, mely meghatároz egy lehetséges útvonalat):
function findPossiblePaths(ant::Ant, graph::Graph)
    possiblePaths = findall(graph.adjMatrix[ant.currentNodeIndex, :] .!= -1);
    
    if !isempty(ant.route)
        for city in ant.route
            if city in possiblePaths
                filter!(x->x≠city, possiblePaths);
            end
        end
    end

    if isempty(possiblePaths)
        push!(possiblePaths, ant.route[1]);
    end
    return possiblePaths;
end

# computing fitness values  računanje fitness vrednosti (függvény, mely kiszámítja a fitness értékét):
function calculateFitness(ant::Ant, graph::Graph)
    pathLength = 0
    for i in 1:(length(ant.route) - 1)
        pathLength += graph.adjMatrix[ ant.route[i], ant.route[i + 1]];
    end
    return pathLength;
end