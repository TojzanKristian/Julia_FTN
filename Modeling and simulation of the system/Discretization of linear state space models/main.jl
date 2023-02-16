using LinearAlgebra;
using ControlSystems;
using Plots;

# EXAMPLES :

# example 1 :
A = [-3 -2; 1 0];
B = [1; 0];
C = [0 5];
D = 0;

# the first way  prvi način (az első módszer) :
λ = eigvals(A); # svojstvene vrednosti (sajátértékek)
println("Example 1 :");println(λ);println();

P = eigvecs(A); # svojstveni vektori (sajátvektorok)
println(P);println();

Ts = 0.1; # selection period  perioda odabiranja (kiválasztási időszak)

E = P * Diagonal(exp.(λ*Ts)) / P;
println(E);println();

F = P * Diagonal((exp.(λ*Ts) .- 1.0) ./ λ) / P * B;
println(F);println();println();

# another way  drugi način (második módszer) :
m = ss(A, B, C, D);
println(m);println();

md = c2d(m,Ts);
println(md);println();println();

# Simulation  simulacija (szimuláció) :
n = Int(5/Ts+1); # the number of moments in the interval  broj trenutaka u intervalu (pillanatok száma az intervallumban)
u = ones(n);
x0 = [0.0; 0.0]; # initial values  početne vrednosti (kezdeti értékek)
x = x0;
X = zeros(n,2); # trajectory of movement  trajektorija kretanja (a mozgás pályája)
X[1,:] = x';

for k = 1:(n-1);
    global x = E*x + F*u[k];
    global X[k+1,:] = x';
end

Y = C*X' + D*u'; # model outputs  izlazi modela (a modell kimenetei)
t = (0:n-1)*Ts;

# draw solution  prikaz rešenja (a megoldás grafikus ábrázolása) :
plot(t, Y', title="Example 1 : Unit response - Discretized", xlabel="t", linetype=:steppost)


# example 2 :
A = [-2 1; 0 -3];
B = [0; 5];
C = [1 0];
D = 0;

# the first way  prvi način (az első módszer) :
λ = eigvals(A); # svojstvene vrednosti (sajátértékek)
println();println();println("Example 2 : ");println(λ);println();

P = eigvecs(A); # svojstveni vektori (sajátvektorok)
println(P);println();

Ts = 0.1; # selection period  perioda odabiranja (kiválasztási időszak)

E = P * Diagonal(exp.(λ*Ts)) / P;
println(E);println();

F = P * Diagonal((exp.(λ*Ts) .- 1.0) ./ λ) / P * B;
println(F);println();println();

# another way  drugi način (második módszer) :
m = ss(A, B, C, D);
println(m);println();

md = c2d(m,Ts);
println(md);

# Simulation  simulacija (szimuláció) :
n = Int(10/Ts+1); # the number of moments in the interval  broj trenutaka u intervalu (pillanatok száma az intervallumban)
u = ones(n);
x0 = [0.0; 0.0]; # initial values  početne vrednosti (kezdeti értékek)
x = x0;
X = zeros(n,2); # trajectory of movement  trajektorija kretanja (a mozgás pályája)
X[1,:] = x';

for k = 1:(n-1)
    global x = E*x + F*u[k]
    global X[k+1,:] = x'
end

Y = C*X' + D*u'; # model outputs  izlazi modela (a modell kimenetei)
t = (0:n-1)*Ts;

# draw solution  prikaz rešenja (a megoldás grafikus ábrázolása) :
plot(t, Y', title="Example 2 : Unit response - Discretized", xlabel="t", linetype=:steppost)