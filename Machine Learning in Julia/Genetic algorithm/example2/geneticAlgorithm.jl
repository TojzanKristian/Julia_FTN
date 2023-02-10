include("population.jl");

# implementation of genetic algorithm  implementacija genetskog algoritma (genetikai algoritmus megvalósítása):
function geneticAlgorithm!(data, elitePercentage, crossoverPoint, mutationPercentage, repeatSize)
   calculatePopulationFitness!(data);
   populationSize = length(data);
   popGen = 0;
   bestFit = data[1].fitness;
   repeatNum = 1;
   eliteSize = Int(trunc(elitePercentage * populationSize));
   eliteSize = eliteSize + (populationSize - eliteSize) % 2;
     
   while (data[1].fitness > 0) && (repeatNum < repeatSize) # while !converge(bestFits)
      elite = deepcopy(selectPopulation(data, eliteSize));
      data = selectPopulation(data, populationSize - eliteSize);
      data = crossoverPopulation(data, crossoverPoint);
      mutatePopulation!(data, mutationPercentage);
      data = [data; elite];
      calculatePopulationFitness!(data);
      
      popGen += 1;
      print("Generation $popGen bestFit $bestFit number of reps $repeatNum \n");

         if abs(bestFit - data[1].fitness) < 0.01
            repeatNum = repeatNum + 1;
         else
            bestFit = data[1].fitness;
            repeatNum = 1;
	      end
     end
   return popGen, repeatNum, data;
end

# a function that returns convergence  funkcija koja vraća konvergenciju (függvény, amely konvergenciát határoz meg):
function converge(bestFits)
   len = length(bestFits);
   if bestFits[len] < 0.01
      return true;
   elseif len < 3
      return false;
   elseif (bestFits[len-2] - bestFits[len]) < 0.001
      return true;
   else
      return false;
   end
end