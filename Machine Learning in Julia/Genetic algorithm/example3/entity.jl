# the structure that represents the entity  struktura koja predstavlja entitet (az egyedet képviselő struktúra):
mutable struct Entity
    genes :: Array{Float64, 1};
    fitness :: Float64;
end

# function that generates the entity  funkcija koja generiše entitet (az egyedet generáló függvény):
function generateEntity(genesLength)
   return Entity(rand(-1.0:0.0001:1.0, genesLength), 0);
end

# function that prints an entity  funkcija koja ispisuje entitet (az egyedet kiíró függvény):
function printEntity(entity1)
   for i in 1:length(entity1.genes)
      print("$(round.(entity1.genes[i]; digits=4)) ");
   end
   print("$(entity1.fitness)\n");
end

# function that counts fitness  funkcija koja računa fitness (a függvény, mely kiszáítja a ftinessz értékét):
function calculateFitness!(entity1)
   x = entity1.genes[1];
   y = entity1.genes[2];
   z = entity1.genes[3];
   w = entity1.genes[4];
   u = entity1.genes[5];
   v = entity1.genes[6];
   # f = |4*x^2- 6*x - 3*y^3 + 0.5*y + 3*z + 8w - 6.1*u +2*v - 10|
   entity1.fitness = abs(4 * x^2 - 6 * x - 3 * y^3 + 0.5 * y + 3 * z + 8 * w - 6.1 * u + 2 * v - 10);
end

# function that mixes genes  funkcija koja meša gene (a géneket keverő függvény):
function crossover!(entity1, entity2, crossoverPoint)
    for i in 1:crossoverPoint
        x = entity1.genes[i];
        entity1.genes[i] = entity2.genes[i];
        entity2.genes[i] = x;
    end
end

# function that mutates genes  funkcija koja mutira gene (a gének mutációját végző funkció):
function mutate!(entity1, mutationPercentage)
    if rand(Float64)<mutationPercentage
	    mutationPoint = rand(1:length(entity1.genes));
        if entity1.genes[mutationPoint] > 0
   	    entity1.genes[mutationPoint] = entity1.genes[mutationPoint]-0.1;
        else
            entity1.genes[mutationPoint] = entity1.genes[mutationPoint]+0.1;
        end
    end
end