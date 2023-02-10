include("entity.jl");

# function that generates a population  funkcija koja generiše populaciju (populációt generáló függvény):
function generatePopulation(n, genesLength)
   data = [];
   for i in 1:n 
       entity1 = generateEntity(genesLength);
       push!(data, entity1);
   end
   return data;
end

# function that prints the population  funkcija koja ispisuje populaciju (függvény, amely kiírja a populációt):
function printPopulation(data)
   for i in 1:length(data)
      printEntity(data[i]);
   end
end

# function that counts fitness for the population  funkcija koja računa fitness za populaciju (függvény, amely a populáció alkalmasságát számolja):
function calculatePopulationFitness!(data)
   for i in 1:length(data)
      calculateFitness!(data[i]);
   end
   sort!(data, by = d -> d.fitness, rev=false);
end

# function that intersects the population  funkcija koja ukršta populaciju (a populációt keverő függvény):
function crossoverPopulation(data, crossoverPoint)
   newData = []
   for i in 1:2:length(data)
      entity1 = deepcopy(data[i]);
      entity2 = deepcopy(data[i+1]);
      crossover!(entity1, entity2, crossoverPoint);
      push!(newData, entity1);
      push!(newData, entity2);
   end
   return newData;
end

# function that mutates the population  funkcija koja mutira populaciju (a populációt mutáló függvény):
function mutatePopulation!(data, mutationPercentage)
   for i in 1:length(data)
      mutate!(data[i], mutationPercentage);
   end
end

# function that selects the population  funkcija koja selektuje populaciju (függvény, mely kiválasztja a populációt):
function selectPopulation(data, n)
   return copy(data[1:n]);
end
