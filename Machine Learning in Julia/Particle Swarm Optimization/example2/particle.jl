# structure that represents a particle/individual  struktura koja predstavlja česticu/jedinku (egy részecskét/egyedet reprezentáló struktúra):
mutable struct Particle
    values :: Array{Float64, 1};
    currentValue :: Float64;
    velocity :: Array{Float64, 1};
    bestValues :: Array{Float64, 1};
    bestValue :: Float64;
end

# function for generating/initializing particles  funkcija za generisanje/inicijalizaciju čestica (függvény a részecskék generálására/inicializálására):
function generateParticle(numberOfOperands, minRang, maxRang)
    particle = Particle(rand(minRang:0.1:maxRang, numberOfOperands), 0, fill(0.0,numberOfOperands), fill(0,numberOfOperands), 0);
    updateValue!(particle);
    particle.bestValues = copy(particle.values);
    particle.bestValue = particle.currentValue;
    return particle;
end

# function to adjust the current value of the particle  funkcija za podešavanje trenutne vrednosti čestice (funkció a részecske aktuális értékének beállításához):
function updateValue!(particle)
    x = particle.values[1];
    y = particle.values[2];
    z = particle.values[3];
    w = particle.values[4];
    u = particle.values[5];
    v = particle.values[6];
    # 4x^2 - 6x - 3y^3 + 0.5y + 3z + 8w - 6.1u + 2v - 10 = 0
    particle.currentValue = 4*x^2 - 6*x - 3*y^3 + 0.5*y + 3*z + 8*w - 6.1*u +2*v - 10;
end

# particle printing function  funkcija za ispis čestice (függvény, mely kiírja a részecskéket/egyedeket):
function printParticle(particle)
    x = particle.values[1];
    y = particle.values[2];
    z = particle.values[3];
    w = particle.values[4];
    u = particle.values[5];
    v = particle.values[6];
    println("4*$x^2 - 6*$x - 3*$y^3 + 0.5*$y + 3*$z + 8*$w - 6.1*$u + 2*$v - 10 = $(particle.currentValue)");
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
    cv = 1.0;
    cp = 2.0;
    cg = 2.0;
    for i in 1:length(particle.velocity)
        particle.velocity[i] = cv * particle.velocity[i] +
	                    cp * rp * (particle.bestValues[i] - particle.values[i]) +
                        cg * rg * (globalBestParticle.values[i] - particle.values[i]);
        if particle.velocity[i] > maxVelocity
            particle.velocity[i] = maxVelocity;
        elseif particle.velocity[i] < -maxVelocity
            particle.velocity[i] = -maxVelocity;
        end
    end
end

# particle position adjustment function  funkcija za podešavanje pozicije čestice (függvény, mely meghatározza az egyed pozicióját):
function updatePosition!(particle, targetValue)
    for i in 1:length(particle.values) 
        particle.values[i] += particle.velocity[i];
        if particle.values[i] > 1
            particle.values[i] = 1.0;
        elseif particle.values[i] < -1
            particle.values[i] = -1.0;
        end
    end        
    updateValue!(particle);
    if abs(particle.currentValue - targetValue) < abs(particle.bestValue - targetValue)
        particle.bestValues = copy(particle.values);
        particle.bestValue = particle.currentValue;
    end
end