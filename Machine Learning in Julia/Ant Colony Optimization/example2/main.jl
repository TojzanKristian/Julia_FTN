include("ACO.jl")

maxIterations = 200; # maksimalan broj iteracija (iterációk maximális száma)
graphNodes = 5; # broj čvorova u grafu (a csomópontok száma a grafban)
antsNumber = 10; # broj mrava (hangyák száma)
pheromoneDepositFactor = 1; # faktor depozita feromona (feromon betéti tényező)
evaporationRate = 0.1; # stopa isparavanja (párolgási sebesség)
pheromoneExponent = 1; # eksponent feromona (feromonok ekszponense)
desirabilityExponent = 2; # željeni eksponent (kívánatosság ekszponense)
graphAdjMatrix = [-1 500 400 500 800;
                  500 -1 200 200 300;
                  400 200 -1 300 500;
                  500 200 300 -1 200;
                  800 300 500 200 -1];

graph = generateGraph(graphNodes, graphAdjMatrix); # graph initialization  inicijalizacija grafa (gráf inicializációja)

# call ACO algorithm  poziv ACO algoritma (ACO algoritmus végrehajtása)
bestPath, bestFitness, graph = runAntColonyOptimization(graphNodes, maxIterations, antsNumber, pheromoneDepositFactor,evaporationRate, pheromoneExponent, desirabilityExponent, graph);

print("Ants have found the best solution that is $(bestPath) with length $(bestFitness)\n");println();
display(graph.pheromoneMatrix);println();
print(graph.pheromoneMatrix);