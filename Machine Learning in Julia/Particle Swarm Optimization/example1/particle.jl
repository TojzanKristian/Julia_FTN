# structure that represents a particle/individual  struktura koja predstavlja česticu/jedinku (egy részecskét/egyedet reprezentáló struktúra):
mutable struct Particle # čestica/jedinka (részecskét/egyedet)
    values :: Array{Int64, 1};
    currentValue :: Int64;
    velocity :: Array{Float64, 1};
    bestValues :: Array{Int64, 1};
    bestValue :: Int64;
end

# function for generating/initializing particles  funkcija za generisanje/inicijalizaciju čestica (függvény a részecskék generálására/inicializálására):
function generateParticle(numberOfOperands, minRang, maxRang)
    particle = Particle(rand(minRang:maxRang, numberOfOperands), 0, fill(0.0,numberOfOperands), fill(0,numberOfOperands), 0);
    updateValue!(particle);
    particle.bestValues = copy(particle.values);
    particle.bestValue = particle.currentValue;
    return particle;
end

# function to adjust the current value of the particle  funkcija za podešavanje trenutne vrednosti čestice (funkció a részecske aktuális értékének beállításához):
function updateValue!(particle)
    sum = 0;
    for i in 1:length(particle.values)
        sum += particle.values[i];
    end
    particle.currentValue = sum;
end

# particle printing function  funkcija za ispis čestice (függvény, mely kiírja a részecskéket/egyedeket):
function printParticle(particle)
    for i in 1:length(particle.values)
        if i < length(particle.values)
            print(particle.values[i], "+");
        else
            print(particle.values[i], "=");
        end
    end
    println(particle.currentValue, "\n");
end

# Formula for speed adjustment : Vi = Cv*Vi + Cp*Rp*(Pi - Xi) + Cg*Rg*(g - Xi) - formula za podešavanje brzine (a sebességet meghatározó képlet)
# Vi -> the speed of the individual  brzina jedinke (ay egyed sebessége)
# Xi -> current value  trenutna vrednost (pillanatnyi értek)
# Pi -> local best value  lokalno najbolja vrednost (a lokális legjobb érték)
# g -> globally best value  globalno najbolja vrednost (a globális legjobb értek)
# Cv = 1 Cp = 2 Cg = 2 -> constants  konstante (konstans értékek)

# particle velocity adjustment function  funkcija za podešavanje brzine čestice (függvény, mely megadja az egyed sebességét):
function updateVelocity!(particle, globalBestParticle, maxVelocity)
    rp = rand(Float64);
    rg = rand(Float64);

    for i in 1:length(particle.velocity)
        particle.velocity[i] = 1.0 * particle.velocity[i] + 
                               2.0 * rp * (particle.bestValues[i] - particle.values[i]) + 
                               2.0 * rg * (globalBestParticle.values[i] - particle.values[i]);
                               
        if particle.velocity[i] > maxVelocity
            particle.velocity[i] = maxVelocity;
        elseif particle.velocity[i] < -maxVelocity
            particle.velocity[i] = -maxVelocity;
        end
    end
end


# Formula for determining the position : xi = xi + vi - formula za određivanje pozicije (a pozíció meghatározására szolgáló képlet)
# xi -> current value  trenutna vrednost (pillanatnyi érték)
# vi -> current speed trenutna brzina (pillanatnyi sebesség)

# particle position adjustment function  funkcija za podešavanje pozicije čestice (függvény, mely meghatározza az egyed pozicióját):
function updatePosition!(particle, targetValue)
    for i in 1:length(particle.values)
        particle.values[i] += trunc(Int64, particle.velocity[i]);
    end
    updateValue!(particle);
    if abs(particle.currentValue - targetValue) < abs(particle.bestValue - targetValue)
        particle.bestValues = copy(particle.values);
        particle.bestValue = particle.currentValue;
    end
end