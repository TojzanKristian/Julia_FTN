include("population.jl");

# a function that returns convergence  funkcija koja vraća konvergenciju (függvény, amely konvergenciát határoz meg):
function converge(bestFits)
   len = length(bestFits);
   if bestFits[len] < 0.01
      return true;
   elseif len<3
      return false;
   elseif (bestFits[len-2] - bestFits[len]) < 0.001
      return true;
   else
      return false;
   end
end

# implementation of genetic algorithm  implementacija genetskog algoritma (genetikai algoritmus megvalósítása):
function geneticAlgorithm!(data, elitePercentage, crossoverPoint, mutationPercentage)
     calculatePopulationFitness!(data);
     populationSize = length(data);
     eliteSize = Int(trunc(elitePercentage * populationSize));
     eliteSize = eliteSize + (populationSize-eliteSize) % 2;
     bestFits = [data[1].fitness];
     while !converge(bestFits)
         elite = deepcopy(selectPopulation(data, eliteSize));
	      data = selectPopulation(data, populationSize-eliteSize);
	      data = crossoverPopulation(data, crossoverPoint);
         mutatePopulation!(data, mutationPercentage);
	      data = [data; elite];
         calculatePopulationFitness!(data);
	      bestFits = [bestFits; data[1].fitness];
     end
     return length(bestFits), data;
end

