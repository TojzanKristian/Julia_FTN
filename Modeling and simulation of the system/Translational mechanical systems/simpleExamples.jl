# A FEW SIMPLE EXAMPLES

using DifferentialEquations;
using Plots;

# Examples :

# example 1 :
# the definition of a function to be solved  definicija funkcije koja treba da se reši (a megoldandó függvény meghatározása):
f(u, p, t) = sin(t);

# initial values  početne vrednosti (kezdeti értékek):
u0 = 0.0;

# time interval  vremenski interval (idő intervallum):
tspan = (0.0, 10.0);

# definition of function  definicija funkcije (a funkció meghatározása):
prob = ODEProblem(f, u0, tspan);

# display return value of ODEProblem() function  prikaz povratne vrednosti ODEProblem() funckije (ODEProblem() függvény működésének kiírása):
#println(prob);println(); # uncomment to see  odkomentarisati da se prikaže (kitörölni a kommentet, hogy megjelenjen)

# function solution  rešenje funkcije (funkció megoldás ):
sol = solve(prob);

# display of solve() function return value  prikaz povratne vrednosti solve() funckije (a solve() függvény visszatérési értékének megjelenítése):
#println(sol); # uncomment to see  odkomentarisati da se prikaže (kitörölni a kommentet, hogy megjelenjen)

# drawing solutions  crtanje rešenja (a megoldás grafikus ábrázolása):
plot(sol, title="Example 1 - sin(t)")


# example 2 :
# function that defines the Van Der Pol oscillator  funkcija koja definiše Van Der Pol-ov oscilator (Van Der Pol oszcillátor definiáló függvénye):
function Van_Der_Pol!(dx, x, p, t)
    μ = p;
    dx[1] = x[2];
    dx[2] = μ*(1 - x[1]^2)*x[2] - x[1];
end

# initial conditions  početni uslovi (kezdeti feltételek):
x0 = [0.25, 0.25];

# time interval  vremenski interval (idő intervallum):
interval = (0.0, 30.0);

# parameters  parametri (paraméterek):
μ = 1.0;
parameters = μ;

# defining a differential equation using the package 'DifferentialEquations'
# definisanje diferencijalne jednačine pomoću paketa 'DifferentialEquations'
# differenciális egyenlet létrehozása a 'DifferentialEquations' csomag segítségével
prob = ODEProblem(Van_Der_Pol!, x0, interval, parameters);

# solution of the differential equation using the package 'DifferentialEquations'
# rešenje diferencijalne jednačine pomoću paketa 'DifferentialEquations'
# differenciális egyenlet megoldása a 'DifferentialEquations' csomag segítségével
sol = solve(prob);

# drawing solutions  crtanje rešenja (a megoldás grafikus ábrázolása):
plot(sol, xlabel="Solution time", ylabel="Solution values", label=["x1" "x2"], title="Example 2 - Van der Pol oscillator")


# example 3 :
# function that creates a differential equation  funkcija koja kreira diferencijalnu jednačinu (differenciális egyenletet létrehozó függvény):
function differentialEquation!(y, param, t)
    α, λ = param;
    dy = λ * exp(-α*t) * y;
    return dy;
end

# function that solves an analytical differential equation  funkcija koja rešava analitički diferencijalnu jednačinu (függvény, amely megoldja analitikusan a differenciál isegyenletet):
function analyticalSolution(t, y0, param)
    α, λ = param;
    y = y0*exp.(λ/α*(1 .- exp.(-α*t)));
    return y;
end

# initial conditions  početni uslovi (kezdeti feltételek):
y0 = 1.0;

# time interval  vremenski interval (idő intervallum):
interval = (0.0, 5.0);

# parameters  parametri (paraméterek):
parameters = (1.0, 1.0);

# defining a differential equation using the package 'DifferentialEquations'
# definisanje diferencijalne jednačine pomoću paketa 'DifferentialEquations'
# differenciális egyenlet létrehozása a 'DifferentialEquations' csomag segítségével
problem = ODEProblem(differentialEquation!, y0, interval, parameters);

# solution of the differential equation using the package 'DifferentialEquations'
# rešenje diferencijalne jednačine pomoću paketa 'DifferentialEquations'
# differenciális egyenlet megoldása a 'DifferentialEquations' csomag segítségével
num = solve(problem);

# time interval  vremenski interval (idő intervallum):
t1 = 0:0.01:5;

# analytical solution of the differential equation  analitičko rešenje diferencijalne jednačine (a differenciális egyenlet analitikus megoldása):
an = analyticalSolution(t1, y0, parameters);

# numerical solution of the differential equation  numeričko rešenje diferencijalne jednačine (a differenciális egyenlet numerikus megoldása):
num1 = num(t1);

# drawing solutions  crtanje rešenja (a megoldás grafikus ábrázolása):
plot(t1, an, xlabel="num.t", ylabel="num.u", label="Analytical",title="Example 3 - Analytical and Numerical solutions")
plot!(t1, num1, label="Numerical")


# example 4 :
# function that creates a differential equation  funkcija koja kreira diferencijalnu jednačinu (differenciális egyenletet létrehozó függvény):
function differentialEquation!(dx, x, param, t)
    A, B = param;
    dx[1] = u(t) + A*x[3];
    dx[2] = x[3];
    dx[3] = -B*x[1] + x[2];
end

# function that creates an input signal  funkcija koja kreira ulazni signal (függvény, amely bemeneti jelet hozza létre):
function u(t)
    tp = rem(t, 5);
    u = 3*tp * (tp < 1) + 3 * ((tp >= 1) & (tp < 3)) + (-tp * 3/2 + 15/2) * ((tp >= 3) & (tp <= 5));
end

# initial conditions  početni uslovi (kezdeti feltételek):
x0y0 = [-1.0, 1.0, 0.5];

# time interval  vremenski interval (idő intervallum):
interval = (0.0, 15.0);

# parameters  parametri (paraméterek):
A, B = (2.0, 1.0);
parameters = (A, B);

# defining a differential equation using the package 'DifferentialEquations'
# definisanje diferencijalne jednačine pomoću paketa 'DifferentialEquations'
# differenciális egyenlet létrehozása a 'DifferentialEquations' csomag segítségével
prob = ODEProblem(differentialEquation!, x0y0, interval, parameters);

# solution of the differential equation using the package 'DifferentialEquations'
# rešenje diferencijalne jednačine pomoću paketa 'DifferentialEquations'
# differenciális egyenlet megoldása a 'DifferentialEquations' csomag segítségével
sol = solve(prob);

# drawing solutions  crtanje rešenja (a megoldás grafikus ábrázolása):
plot(sol, xlabel="Solution time", ylabel="Solution values", label=["x1" "x2" "x3"], title="Example 4")