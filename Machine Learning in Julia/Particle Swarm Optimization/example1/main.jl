include("algorithm.jl");

numberOfParticle = 10; # broj čestica (részecskék száma)
numberOfOperands = 5; # broj operanada (operandusok száma)
minRang = 100; # vrednost od koje se kreće generisanje (érték, melytől indul a raj generálása)
maxRang = 200; # vrednost do koje se vrši generisanje (értek, ameddig tart a raj generálása)
targetValue = 200; # tražena vrednost (célérték)
maxIteration = 2000; # maksimalna broj iteracija (iterációk maximális száma)
maxVelocity = 10; # maksimalna brzina (maximális sebesség)

swarm = generateSwarm(numberOfParticle, numberOfOperands, minRang, maxRang); # generisanje/inicijalizacija roja (raj generálása/inicializálása)

PSOAlgorithm(swarm, targetValue, maxIteration, maxVelocity); # poziv PSO algoritma (PSO algoritmus alkalmazása)