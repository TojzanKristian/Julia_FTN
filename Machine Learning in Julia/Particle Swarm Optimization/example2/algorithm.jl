include("swarm.jl");

# implementation of the algorithm  implementacija algoritma (az algoritmus megvalósítása):
function PSOAlgorithm(swarm, targetValue, maxIteration, maxVelocity)
    globalBestParticle = swarm[1];
    globalBestParticle = calculateGlobalBestParticle(swarm,targetValue,globalBestParticle);
    bestValues = [globalBestParticle.currentValue];
    for i in 1:maxIteration
        if converge(bestValues)
            printSwarm(swarm);
            println("SOLUTION :");
            printParticle(globalBestParticle);
            println();
            println("Solution found after $i iteration");
            return
        end
        updateSwarmVelocity!(swarm,globalBestParticle,maxVelocity);
        updateSwarmPosition!(swarm,targetValue);
        globalBestParticle = calculateGlobalBestParticle(swarm,targetValue,globalBestParticle);
        bestValues = [bestValues; globalBestParticle.currentValue];
    end
    printSwarm(swarm);
    println("GLOBAL SOLUTION :");
    printParticle(globalBestParticle);
end

# function that counts the global best individual  funkcija koja računa globalno najbolju jedinku (függvény, mely a globális legjobb egyedet határozza meg):
function calculateGlobalBestParticle(swarm, targetValue, globalBestParticle)
    for i in 1:length(swarm) 
        if abs(swarm[i].currentValue - targetValue) < abs(globalBestParticle.currentValue - targetValue)
            globalBestParticle = deepcopy(swarm[i]);
        end
    end
    return globalBestParticle;
end

# function for better convergence  funkcija za bolju konvergenciju (a jobb konvergenciát biztosító függvény):
function converge(bestValues)
    len = length(bestValues)
    if bestValues[len] == 0.0
       return true;
    elseif len < 5
       return false;
    elseif bestValues[len] > 0.01 || bestValues[len] < -0.01
       return false;
    else 
       return abs(bestValues[len-4]-bestValues[len]) < 0.01;
    end
 end