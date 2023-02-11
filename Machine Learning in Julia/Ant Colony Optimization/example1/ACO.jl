#= ANT COLONY OPTIMIZATION
Step 1 : Initialization of pheromone traces , setting parameters
Step 2 : Repeat until the stop criteria is met :
        - every ant -> Construction of solutions using trace pheromones
        - Pheromone Update Evaporation and Amplification
Step 3 : The best solutions or a set of solutions
=#

using StatsBase;

include("ant.jl");
include("graph.jl");

# implementation of the algorithm  implementacija algoritma (az algoritmus megvalósítása):
function AntColonyOptimization(graphNodes, foodNode, maxIterations, antsNumber, pheromoneDepositFactor, evaporationRate, pheromoneExponent, desirabilityExponent, graph)
    bestFitness = Inf;
    bestPath = [];

    for i in 1 : maxIterations
        ants = generateAntPopulation(antsNumber, 1);
       
        for j in 1:antsNumber
            antReachedDestination = false;
            while !antReachedDestination
                possiblePaths = findPossiblePaths(ants[j], graph);
                probabilities = calculateProbabilities(ants[j], possiblePaths, graph, pheromoneExponent, desirabilityExponent);
                chosenNode = sample(possiblePaths, Weights(probabilities));
                push!(ants[j].route, ants[j].currentNodeIndex);
                ants[j].currentNodeIndex = chosenNode;
                if chosenNode == graph.foodIndex
                    antReachedDestination = true;
                    push!(ants[j].route, ants[j].currentNodeIndex);
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
    pheromoneDepositMatrix = zeros(Float64, graph.nodesCount, graph.nodesCount);

    for currentAnt in ants
        route = currentAnt.route;
        for j in 1 : length(currentAnt.route) - 1
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
    pathsSum = 0

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
	    possiblePaths = deleteat!(possiblePaths, findall(possiblePaths.==ant.route[end]));
    end
    return possiblePaths;
end

# computing fitness values  računanje fitness vrednosti (függvény, mely kiszámítja a fitness értékét):
function calculateFitness(ant::Ant, graph::Graph)
    pathLength = 0;
    for i in 1:(length(ant.route) - 1)
        pathLength += graph.adjMatrix[ ant.route[i], ant.route[i + 1]];    
    end
    return pathLength;
end