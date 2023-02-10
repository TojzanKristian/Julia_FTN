include("geneticAlgorithm.jl");

genesLength = 6; # dužina gena (a gének hossza)
populationSize = 50; # veličina populacije (a populáció nagysága)
crossoverPoint = 3; # tačka ukrštanja (a pont ahol megtörténik a keveredés)
mutationPercentage = 0.2; # procenat mutacije 20% (a mutáció százalék aránya 20%)
elitePercentage = 0.2; # procenat elite 20% (az elit százalékos aránya 20%)
repeatSize = 3; # broj ponavljanja (ismétlések száma)

population = generatePopulation(populationSize, genesLength); # generišemo populaciju (a populáció generálása)

calculatePopulationFitness!(population); # računamo fitness (fitnessz kiszámolása)

printPopulation(population); # ispisujemo populaciju pre genetskog algoritma (populáció kiírása genetikai algoritmusok előtt)
println();

popGen, repeatNum, population = geneticAlgorithm!(population, elitePercentage, crossoverPoint, mutationPercentage, repeatSize); # genetski algoritam (genetikai algoritmus)

println();
printPopulation(population); # ispis populacije posle genetskog algoritma (populáció kiírása genetikai algoritmusok után)

println();
print("The total number of generations is : $popGen \n"); # broj generacija (generációk száma)
println();

print("The number of repetitions of the last best finesse is : $repeatNum \n");