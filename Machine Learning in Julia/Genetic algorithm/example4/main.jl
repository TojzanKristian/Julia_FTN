# The knapsack problem
# Problem ranca
# A hátizsák problémája

include("geneticAlgorithm.jl");

numberOfRocks = 20; # broj kamenja (a kövek száma)
values = rand(1:100, numberOfRocks); # vrednosti (értékek)
weights = rand(1:10, numberOfRocks); # težine (súly)
maxCapacity = 30; # ukupan/max kapacitet (makszimális kapacitás)
populationSize = 50; # veličina populacije (a populáció nagysága)
crossoverPoint1 = 7; # 1. tačka ukrštanja (az első ahol megtörténik a keveredés)
crossoverPoint2 = 14; # 2. tačka ukrštanja (a második ahol megtörténik a keveredés)
mutationPercentage = 0.1; # procenat mutacije 10% (a mutáció százalék aránya 10%)
elitePercentage = 0.1; # procenat elite % (az elit százalékos aránya 10%)

population = generatePopulation(populationSize, numberOfRocks); # generišemo populaciju (a populáció generálása)

popGen, population = geneticAlgorithm!(population, elitePercentage, crossoverPoint1, crossoverPoint2,mutationPercentage, values, weights, maxCapacity); # genetski algoritam (genetikai algoritmus)

printPopulation(population); # ispis populacije (a populáció kiírása)
println();
println("The total number of stones is : $numberOfRocks"); # ukupan broj kamenja (az össz kövek számsa)
println("The weight of the stones is : $weights"); # težine kamenja (a kövek súlya)
println("The value of the stones is : $values"); # vrednosti kamenja(a kövek értékek)
println("The maximum weight of the stones is : $maxCapacity"); # ukupna/max težina (a legnagyobb súly)

println("Results: ");
sumWeights = sum(weights[population[1].genes.==1]);
if sumWeights > maxCapacity
   println("No solution found!");
else
   println("The weight of the selected stones is: $sumWeights"); # težina izabranog kamenja (a kiválasztott kövek súlya)
   value = sum(values[population[1].genes.==1]);
   println("The value of the selected stones is: $value"); # vrednosti izabranog kamenja (a kiválasztott kövek értékek)
   println("The total number of generations is : $popGen"); # broj generacija (a generációk száma)
   println("The ideal individual : $(population[1])"); # najbolja jedinka (a legjobb egyed)
   println("Stones with ordinal numbers are selected: ");
   for i in 1:numberOfRocks
      if population[1].genes[i]==0
         print("$i ");
      end
   end
end