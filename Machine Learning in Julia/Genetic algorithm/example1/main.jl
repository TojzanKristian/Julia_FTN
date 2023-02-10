include("geneticAlgorithm.jl");

genesLength = 20; # dužina gena (a gének hossza)
populationSize = 20; # veličina populacije (a populáció nagysága)
fitValue = 19; # fitness vrednost (fitnessz értéke)
crossoverPoint = 3; # tačka ukrštanja (a pont ahol megtörténik a keveredés)
mutationPercentage = 0.2; # procenat mutacije 20% (a mutáció százalék aránya 20%)
selectionSize = 5; # broj selekcija (a kiválasztások száma )
repeatSize = 3; # broj ponavljanja (ismétlések száma)

population = generatePopulation(populationSize, genesLength); # generišemo populaciju (a populáció generálása)

calculatePopulationFitness!(population, fitValue); # računamo fitness (fitnessz kiszámolása)

printPopulation(population); # ispisujemo populaciju pre genetskog algoritma (populáció kiírása genetikai algoritmusok előtt)
println();

popGen, repeatNum, population = geneticAlgorithm!(population, fitValue, selectionSize, crossoverPoint, mutationPercentage, repeatSize); # genetski algoritam (genetikai algoritmus)

println();
printPopulation(population); # ispis populacije posle genetskog algoritma (populáció kiírása genetikai algoritmusok után)

println();
print("The total number of generations is : $popGen \n"); # broj generacija (generációk száma)
println();

print("The number of repetitions of the last best finesse is : $repeatNum \n");