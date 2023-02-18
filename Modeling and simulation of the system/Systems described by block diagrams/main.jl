# FEW EXAMPLES FROM THE SYSTEMS DESCRIBED BY BLOCK DIAGRAMS

using DifferentialEquations;
using ControlSystems;
using Plots;
using LinearAlgebra;

# EXAMPLES :

# example 1 :
# function that solves the system  funkcija koja rešava sistem (függvény, amely megoldja a rendszert):
function sistem(dx, x, p, t)
    y = x[1] - 2 * x[2];
    r = sin(2 * t);
    u = r - 0.1 * y^2;
    dx[1] = -0.1 * x[1] + 0.25 * x[2];
    dx[2] = -0.5 * x[1] + 0.75 * u;
end

tspan = (0.0, 5.0); # time interval  vremenski interval (idő intervallum)
x0 = [0.5, -0.2]; # initial values  početne vrednosti (kezdeti értékek)

# solution by applying the package 'DifferentialEquations'  rešenje primenom paketa 'DifferentialEquations' (megoldás a 'DifferentialEquations' csomag alkalmazásával):
prob = ODEProblem(sistem, x0, tspan);
sol = solve(prob);

x1 = [x[1] for x in sol.u];
x2 = [x[2] for x in sol.u];

y = x1 - 2 * x2;
r = sin.(2 * sol.t);
println("Solution is :");
println(r);println();println();

# drawing solutions  crtanje rešenja (a megoldás grafikus ábrázolása):
plot(sol.t, r, label = "r",title="Example 1")
plot!(sol.t, y, label = "y", xlabel = "t[s]")


# example 2 :
# function that solves the system  funkcija koja rešava sistem (függvény, amely megoldja a rendszert):
function sistem(dx, x, p, t)
    v = p;
    e = u(t) - 2*x[4];
    q = v(t) + x[1];
    dx[1] = e - 2*x[1];
    dx[2] = x[3];
    dx[3] = 3*q - x[2];
    dx[4] = 4*x[2] - x[4];
end

# function that defines the input signal  funkcija koja definiše ulazni signal (a bemeneti jelet meghatározó függvény):
function u(t)
    tp = rem(t, 5);
    y = 5*tp * (tp < 1) + 5 * ((tp >=1) & (tp < 4)) + (-5*tp + 25) * (tp >=4);
end

interval = (0.0, 10.0); # time interval  vremenski interval (idő intervallum)
x0 = [0.0, 2.0, 1.0, 0.0]; # initial values  početne vrednosti (kezdeti értékek)
param = (t -> (t >= 3.0) ? 1.0 : 0.0); # parameters  parametri (paraméterek)

# solution by applying the package 'DifferentialEquations'  rešenje primenom paketa 'DifferentialEquations' (megoldás a 'DifferentialEquations' csomag alkalmazásával):
prob = ODEProblem(sistem, x0, interval, param);
r = solve(prob);

y = [x[4] for x in r.u];
println("Solution is :");
println(y);println();println();

# drawing solutions  crtanje rešenja (a megoldás grafikus ábrázolása):
plot(r.t, y, label = "output y", xlabel = "t[s]", title="Example 2")


# example 3 :
# function that defines the input signal  funkcija koja definiše ulazni signal (a bemeneti jelet meghatározó függvény):
function inputSignal(t)
    y = t .* (t .< 2) .+ 2 .* ((t .>= 2) .& (t .< 6)) .+ (-t .+ 8) .* (t .>= 6);
end

# a function that represents the solution of the upper branch  funkcija koja predstavlja rešenje gornje grane (függvény, amely a felső ág megoldását képviseli):
function upperBranch!(dx, x, p, t)
    u = inputSignal(t);
    dx[1] = x[2];
    dx[2] = 0.5 * u + x[1] - x[1] * x[2];
end

tspan = (0.0, 8.0); # time interval  vremenski interval (idő intervallum)
x0 = [-1, 0.5]; # initial values  početne vrednosti (kezdeti értékek)

# solution by applying the package 'DifferentialEquations'  rešenje primenom paketa 'DifferentialEquations' (megoldás a 'DifferentialEquations' csomag alkalmazásával):
prob = ODEProblem(upperBranch!, x0, tspan);
sol = solve(prob);

# First way  prvi način (első módszer) :
# a function that represents the solution of the lower branch  funkcija koja predstavlja rešenje donje grane (függvény, amely az alsó ág megoldását képviseli):
function lowerBranch()
    G = tf([1, 4], [1, 1, 2]);
    H = tf(5, [5, 4]);
    return minreal(feedback(G, H));
end

t = 0:0.01:8; # time interval  vremenski interval (idő intervallum)
input = inputSignal(t); # the value of the input signal  vrednost ulaznog signala (a bemeneti jel értéke)

sol_interpolirano = sol(t);
y = [x[1] for x in sol_interpolirano.u];
p = 3 .* (y .< -3) .+ (-3/4 * y .+ 3/4) .* ((y .>= -3) .& (y .< 1));

G = lowerBranch();
println("Solution for lower branch is :");
println(G);println();

k, ~, ~ = lsim(G, input', t);
z = p .+ k';

# drawing solutions  crtanje rešenja (a megoldás grafikus ábrázolása):
plot(t, z, lw=2, label="z(t)", xticks=0:8, xlabel="t [s]", title="Example 3")

# Second way  drugi način (második módszer) :
# function that solves the system  funkcija koja rešava sistem (egy függvény, amely megoldja a rendszert):
function sistem!(dx, x, p, t)
    u = inputSignal(t);
    e = u - x[5];
    k = 4 * x[3] + x[4];
    dx[1] = x[2];
    dx[2] = 0.5 * u + x[1] - x[1] * x[2];
    dx[3] = x[4];
    dx[4] = e - 2 * x[3] - x[4];
    dx[5] = k - 4/5 * x[5];
end

tspan = (0.0, 8.0); # time interval  vremenski interval (idő intervallum)
x0 = [-1.0, 0.5, 0.0, 0.0, 0.0]; # initial values  početne vrednosti (kezdeti értékek)

# solution by applying the package 'DifferentialEquations'  rešenje primenom paketa 'DifferentialEquations' (megoldás a 'DifferentialEquations' csomag alkalmazásával):
prob = ODEProblem(sistem!, x0, tspan);
sol = solve(prob);

t = 0:0.01:8; # time interval  vremenski interval (idő intervallum)
sol_interpolirano = sol(t);
y = [x[1] for x in sol_interpolirano.u];
p = 3 .* (y .< -3) .+ (-3/4 * y .+ 3/4) .* ((y .>= -3) .& (y .< 1));

x3 = [x[3] for x in sol_interpolirano.u];
x4 = [x[4] for x in sol_interpolirano.u];

k = 4 * x3 .+ x4;
z = p .+ k;

plot(t, z, lw=2, title="Example 3")