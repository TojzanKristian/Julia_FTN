include("analyse.jl");

genesLength = 6; # dužina gena (a gének hossza)
populationSize = 50; # veličina populacije (a populáció nagysága)
crossoverPoint = 3; # tačka ukrštanja (a pont ahol megtörténik a keveredés)
crossoverRange = collect(2:5);
mutationPercentage = 0.1; # procenat mutacije 10% (a mutáció százalék aránya 10%)
mutationRange = collect(0:0.01:0.3);
elitePercentage = 0.1; # procenat elite % (az elit százalékos aránya 10%)
eliteRange = collect(0:0.01:0.3);
numOfIterations = 200; # broj ponavljanja (ismétlések száma)

population = generatePopulation(populationSize, genesLength);  # generišemo populaciju (a populáció generálása)

minIndex, optimalElite, resultsFit, resultsGen = findBestElitePercentage(population, eliteRange, crossoverPoint, mutationPercentage, numOfIterations);
println("Detection of optimal values for the percentage of elite in the population :");
println("The value of the percent of the detection elite: $eliteRange");
println("The best average fitness : $optimalElite");
println("The ordinal number of the optimum percentage of the elite in a row: $minIndex");
println("The best percentage of elites: $(eliteRange[minIndex])");
println("Average fitness value: $(round.(resultsFit, digits = 4))");
println("Average number of generations: $resultsGen");
println();println();

minCrossIndex, minMutIndex, optimalValue, resultsFit, resultsGen = findBestCrossoverAndMutation(population, elitePercentage, crossoverRange, mutationRange, numOfIterations);
println("Detection of optimal values for crossing point and percentage of mutation in the population:");
println("Crossover point value for detection: $crossoverRange");
println("The value of the percentage of mutations for detection: $mutationRange");
println("The best average fitness : $optimalValue");
println("The best crossover point: $(crossoverRange[minCrossIndex])");
println("The best percentage of mutations: $(mutationRange[minMutIndex])");
println("Average fitness value:");
display(transpose(round.(resultsFit, digits = 4)));
println("Average number of generations:");
display(transpose(resultsGen));