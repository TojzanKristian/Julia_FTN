#= GENETIC ALGORITHM
Step 1 : Initialization - creation of the initial population
Step 2 : Calculation of fitness function for each individual in the population
Step 3 : Repeat :
         - Selection
         - Crossover
         - Mutate
         - Calculating fitness function for each individual in the population
Step 4 : Choosing the individual with the highest fitness function=#

include("population.jl");

# implementation of genetic algorithm  implementacija genetskog algoritma (genetikai algoritmus megvalósítása):
function geneticAlgorithm!(data, fitValue, selectionSize, crossoverPoint, mutationPercentage, repeatSize)
     calculatePopulationFitness!(data, fitValue);
     popGen = 0;
     bestFit = data[1].fitness;
     repeatNum = 1;

     while (data[1].fitness > 0) && (repeatNum < repeatSize)
        data = selectPopulation(data, selectionSize);
        data = crossoverPopulation(data, crossoverPoint);
        mutatePopulation!(data, mutationPercentage);
        calculatePopulationFitness!(data, fitValue);

        popGen += 1;
        print("Generation $popGen bestFit $bestFit number of reps $repeatNum \n");
        
        if bestFit == data[1].fitness
           repeatNum +=  1;
        else
           bestFit = data[1].fitness
           repeatNum = 1;
	      end
     end
     return popGen, repeatNum, data;
end