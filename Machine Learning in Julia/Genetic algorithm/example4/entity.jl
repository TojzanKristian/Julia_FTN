# the structure that represents the entity  struktura koja predstavlja entitet (az egyedet képviselő struktúra):
mutable struct Entity
   genes :: Array{Int64, 1};
   fitness :: Int64;
end

# function that generates the entity  funkcija koja generiše entitet (az egyedet generáló függvény):
function generateEntity(genesLength)
   return Entity(rand(0:1, genesLength), 0);
end

# function that prints an entity  funkcija koja ispisuje entitet (az egyedet kiíró függvény):
function printEntity(entity1)
   for i in 1:length(entity1.genes)
      print(entity1.genes[i]);
   end
   print(" $(entity1.fitness) \n");
end

# function that counts fitness  funkcija koja računa fitness (a függvény, mely kiszáítja a ftinessz értékét):
function calculateFitness!(entity1, values, weights, maxCapacity)
   selectedWeights = weights[entity1.genes.== 1];
   sumSelectedWeights = sum(selectedWeights);
   if sumSelectedWeights > maxCapacity
      entity1.fitness = sum(values);
   else
      notSelectedValues = values[entity1.genes.== 0];
      entity1.fitness = sum(notSelectedValues);
   end
end

# function that mixes genes  funkcija koja meša gene (a géneket keverő függvény):
function crossover!(entity1, entity2, crossoverPoint1, crossoverPoint2)
   for i in (crossoverPoint1 + 1):crossoverPoint2
         x = entity1.genes[i];
         entity1.genes[i] = entity2.genes[i];
         entity2.genes[i] = x;
   end
end

# function that mutates genes  funkcija koja mutira gene (a gének mutációját végző funkció):
function mutate!(entity1, mutationPercentage)
   if rand(Float64) < mutationPercentage
	   mutationPoint = rand(1:length(entity1.genes));
	   entity1.genes[mutationPoint] = 1 - entity1.genes[mutationPoint];
   end
end