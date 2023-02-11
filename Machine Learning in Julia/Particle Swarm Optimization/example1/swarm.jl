include("particle.jl");

# swarm generation function  funkcija za generisanje roja (a rajt generáló függvény):
function generateSwarm(n, numberOfOperands, minRang, maxRang)
    swarm = [];
    for i in 1 : n
        particle = generateParticle(numberOfOperands, minRang, maxRang);
        push!(swarm, particle);
    end
    return swarm;
end

# swarm printing function  funkcija za ispis roja (a rajt kiíró függvény):
function printSwarm(swarm)
    for i in eachindex(swarm)
        printParticle(swarm[i]);
    end
end

# swarm speed adjustment function  funkcija za podešavanje brzine roja (a raj sebességét beállító függvény):
function updateSwarmVelocity!(swarm, globalBestParticle, maxVelocity)
    for i in eachindex(swarm)
        updateVelocity!(swarm[i], globalBestParticle, maxVelocity);
    end
end

# function to adjust the position of the swarm  funkcija za podešavanje pozicije roja (a raj pozicióját beállító függvény):
function updateSwarmPosition!(swarm, targetValue)
    for i in eachindex(swarm) 
        updatePosition!(swarm[i], targetValue);
    end
end