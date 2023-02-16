# SEVERAL COMPLEX EXAMPLES

using LinearAlgebra;
using Plots;
using DifferentialEquations;

# Examples :

# example 1 :
# function that creates a differential equation  funkcija koja kreira diferencijalnu jednačinu (differenciális egyenletet létrehozó függvény):
function sistem!(dx, x, p, t)
    m, c1, c2, k = p;
    f = sin(t);
    dx[1] = x[2];
    dx[2] = 1 / m * (f - k * x[1] - (c1 + c2) * x[2]);
end

# initial conditions  početni uslovi (kezdeti feltételek):
x0 = [0, 0];

# time interval  vremenski interval (idő intervallum):
t = (0.0, 10.0);

# parameters  parametri (paraméterek):
p = (10.0, 20.0, 20.0, 40.0);

# defining a differential equation using the package 'DifferentialEquations'
# definisanje diferencijalne jednačine pomoću paketa 'DifferentialEquations'
# differenciális egyenlet létrehozása a 'DifferentialEquations' csomag segítségével
prob = ODEProblem(sistem!, x0, t, p);

# solution of the differential equation using the package 'DifferentialEquations'
# rešenje diferencijalne jednačine pomoću paketa 'DifferentialEquations'
# differenciális egyenlet megoldása a 'DifferentialEquations' csomag segítségével
sol = solve(prob);

# drawing solutions  crtanje rešenja (a megoldás grafikus ábrázolása):
plot(sol, label=["x1(t)" "x2(t)"], lw=2, xticks=0:10, title="Example 1")


# example 2 :
function sistem!(dx, x, p, t)
    m, c, k, g = p;
    f = cos(t);
    dx[1] = x[2];
    dx[2] = 1 / m * (f + m * g - k * x[1] - c * x[2]);
end

x0 = [0.0, 0.0];

t = (0.0, 20.0);

p = (5.0, 10.0, 20.0, 9.81);

prob = ODEProblem(sistem!, x0, t, p);
sol = solve(prob);

plot(sol, label=["x1(t)" "x2(t)"], lw=2, xticks=0:20, title="Example 2")


# example 3 :
function inputSignal(t)
    tp = rem.(t, 5);
    y = (4 * tp) .* (tp .< 1) + 4 .* ((tp .>= 1) .& (tp .< 2)) +
    (-2 * tp .+ 8) .* ((tp .>= 2) .& (tp .< 3)) + 2 .* ((tp .>= 3) .& (tp .< 4)) +
    (-2 * tp .+ 10) .* (tp .>= 4);
end

function sistem!(dx, x, p, t)
    m1, m2, c1, c2, c3, k1, k2 = p;
    f = inputSignal(t);
    dx[1] = x[2];
    dx[2] = 1 / m1 * (f + c1 * (x[4] - x[2]) - k1 * x[1]);
    dx[3] = x[4];
    dx[4] = - 1 / m2 * (c1 * (x[4] - x[2]) + (c2 + c3) * x[4] + k2 * x[3]);
end

t = (0.0, 10.0);

p = (10.0, 15.0, 20.0, 20.0, 20.0, 40.0, 40.0);

x0 = [0.0, 0.0, 0.0, 0.0];

prob = ODEProblem(sistem!, x0, t, p);
sol = solve(prob);

# finding the positions of both bodies in the solution set sol.u  pronalaženje pozicija oba tela u skupu rešenja sol.u (mindkét test helyzetének megtalálása a sol.u -ban):
poz1 = [x[1] for x in sol.u];
poz2 = [x[3] for x in sol.u];

# find the maximum position for both bodies  pronalaženje maksimalne pozicije za oba tela (mindkét test maximális sebességének meghatározása):
~, index1 = findmax(abs.(poz1));
~, index2 = findmax(abs.(poz2));

# display of solutions and maximum positions  prikaz rešenja i maksimalnih pozicija (a megoldás és maximális pozíciók kirajzolása):
plot(sol.t, [poz1, poz2], lw=2, xticks=0:10, label=["x1(t)" "x2(t)"], title="Example 3")
plot!([sol.t[index1]], [poz1[index1]], markershape=:o, label="max_poz1")
plot!([sol.t[index2]], [poz2[index2]], markershape=:o, label="max_poz2")

# calculate the total distance traveled for both bodies  izračunavanje ukupnog pređenog puta za oba tela (mindkét test megtett távolságának kiszámítása):
p1 = sum(abs.(diff(poz1)));
p2 = sum(abs.(diff(poz2)));
print("The total distance traveled for the first body is : $p1\n");
print("The total distance traveled for the second body is : $p2\n\n");


# example 4 :
function sistem!(dx, x, p, t)
    m1, m2, c, k1, k2, k3, g = p;
    dx[1] = x[2];
    dx[2] = 1 / m1 * (m1 * g + k2 * x[3] - (k1 + k2) * x[1]);
    dx[3] = x[4];
    dx[4] = 1 / m2 * (k2 * x[1] - m2 * g - c * x[4] - (k2 + k3) * x[3]);
end

t = (0.0, 20.0);

p = (5.0, 8.0, 10.0, 20.0, 20.0, 20.0, 9.81);

x0 = [2.0, 0.0, 0.0, 0.0];

prob = ODEProblem(sistem!, x0, t, p);
sol = solve(prob);

# finding the speed of both bodies in the sol.u solution set  pronalaženje brzina oba tela u skupu rešenja sol.u (mindkét test sebességeinek megtalálása a sol.u -ban):
v1 = [x[2] for x in sol.u];
v2 = [x[4] for x in sol.u];

# finding the maximum speed for both bodies  pronalaženje maksimalne brzine za oba tela (mindkét test maximális sebességének meghatározása):
~, index1 = findmax(abs.(v1));
~, index2 = findmax(abs.(v2));

# display of solutions and maximum speeds  prikaz rešenja i maksimalnih brzina (a megoldás és maximális sebességek kirajzolása):
plot(sol.t, [v1, v2], lw=2, label=["v1(t)" "v2(t)"],titlr="Example 4")
plot!([sol.t[index1]], [v1[index1]], markershape=:o, label="max_v1")
plot!([sol.t[index2]], [v2[index2]], markershape=:o, label="max_v2")

# calculate the acceleration of both bodies  izračunavanje ubrzanja oba tela (mindkét test gyorsulásának kiszámítása):
a1 = diff(v1) ./ diff(sol.t);
a2 = diff(v2) ./ diff(sol.t);

print("\nThe acceleration of the first body is : $a1\n");
print("The acceleration of the second body is : $a2");

plot(sol.t[1:end-1], [a1, a2], lw=2, label=["a1(t)", "a2(t)"])