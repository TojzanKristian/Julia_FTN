#=Task : solve the following function :
f(x) = 4x^2 - 6x - 3y^3 + 0.5y + 3z + 8w - 6.1u + 2v - 10 = 0
search for solutions in the interval of real numbers [-1, 1]=#

include("algorithm.jl");

numberOfParticles = 10; # broj čestica (részecskék száma)
numberOfOperands = 6; # broj operanada (operandusok száma)
minRang = -1; # vrednost od koje se kreće generisanje (érték, melytől indul a raj generálása)
maxRang = 1; # vrednost do koje se vrši generisanje (értek, ameddig tart a raj generálása)
targetValue = 0; # tražena vrednost (célérték)
maxIteration = 200; # maksimalna broj iteracija (iterációk maximális száma)
maxVelocity = 0.2; # maksimalna brzina (maximális sebesség)

swarm = generateSwarm(numberOfParticles, numberOfOperands, minRang, maxRang); # generisanje/inicijalizacija roja (raj generálása/inicializálása)

PSOAlgorithm(swarm, targetValue, maxIteration, maxVelocity); # poziv PSO algoritma (PSO algoritmus alkalmazása)