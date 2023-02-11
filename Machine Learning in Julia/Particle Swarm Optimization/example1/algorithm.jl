#= PARTICLE SWARM OPTIMIZATION
Step 1 : Swarm initialization
Step 2 : Calculating the Global Best Score
Step 3 : Check ing stop criteria :
    - updating particle speeds
    - updating particle positions
    - calculating global best result
Step 4 :Print global best result=#

include("swarm.jl");

# implementation of the algorithm  implementacija algoritma (az algoritmus megvalósítása):
function PSOAlgorithm(swarm, targetValue, maxIteration, maxVelocity)
    globalBestParticle = swarm[1];
    globalBestParticle = calculateGlobalBestParticle(swarm, targetValue, globalBestParticle);

    for i in 1 : maxIteration
        if globalBestParticle.currentValue == targetValue
            printSwarm(swarm); # ispis roja (raj kiírása)
            println("SOLUTION :");
            printParticle(globalBestParticle); # ispis globalno najbolje čestice (a globálisan legjobb egyed kiírása)
            println("Solution found after $i iteration"); # ispis broja iteracija (az iterációk számának kiírása)
            return;
        end
        updateSwarmVelocity!(swarm, globalBestParticle, maxVelocity); # podešavanje brzine roja (a raj sebességének beállítása)
        updateSwarmPosition!(swarm, targetValue); # podešavanje pozicije roja (a raj helyzetének beállítása)
        globalBestParticle = calculateGlobalBestParticle(swarm, targetValue, globalBestParticle);
    end

    printSwarm(swarm); # ispis roja (raj kiírása)
    println("GLOBAL SOLUTION :");
    printParticle(globalBestParticle); # ispis globalno najbolje čestice (a globálisan legjobb egyed kiírása)
end

# function to determine the global best particle  funkcija za određivanje globalno najbolje čestice (függvény a globális legjobb részecske meghatározásához):
function calculateGlobalBestParticle(swarm, targetValue, globalBestParticle)
    for i in eachindex(swarm)
        if abs(swarm[i].currentValue - targetValue) < abs(globalBestParticle.currentValue - targetValue);
            globalBestParticle = deepcopy(swarm[i]);
        end
    end
    return globalBestParticle;
end