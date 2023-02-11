include("ACO.jl");

maxIterations = 200; # maksimalan broj iteracija (iterációk maximális száma)
graphNodes = 3; # broj čvorova u grafu (a csomópontok száma a grafban)
antsNumber = 40; # broj mrava (hangyák száma)
antsStartNode = 1; # čvor iz kojeg mravi kreću (a csomópont, ahonnan a hangyák elindulnak)
foodNode = 3; # čvor u kojem se nalazi hrana (a csomópont, amelyben az étel található)
pheromoneDepositFactor = 1; # faktor depozita feromona (feromon betéti tényező)
evaporationRate = 0.1; # stopa isparavanja (párolgási sebesség)
pheromoneExponent = 1; # eksponent feromona (feromonok ekszponense)
desirabilityExponent = 0.1; # željeni eksponent (kívánatosság ekszponense)

graph = generateGraph(graphNodes, [-1 50 100; 50 -1 60; 100 60 -1], foodNode); # graph initialization  inicijalizacija grafa (gráf inicializációja)

# call ACO algorithm  poziv ACO algoritma (ACO algoritmus végrehajtása)
bestPath, bestFitness, graph = AntColonyOptimization(graphNodes, foodNode, maxIterations, antsNumber, pheromoneDepositFactor, evaporationRate, pheromoneExponent, desirabilityExponent, graph);

print("Ants have found the best solution that is $(bestPath) with length $(bestFitness)\n");
println();
println(graph.pheromoneMatrix);