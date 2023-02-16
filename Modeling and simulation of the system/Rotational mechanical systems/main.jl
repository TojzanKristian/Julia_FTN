using Plots;
using DifferentialEquations;

# EXAMPLES :

# example 1 :
# function that creates a differential equation  funkcija koja kreira diferencijalnu jednačinu (differenciális egyenletet létrehozó függvény):
function sistem!(dx, x, p, t)
m1, m2, c, k1, k2, R, g = p
    f = sin(t);
    J = 1 / 2 * m1 * R^2;
    dx[1] = x[2];
    dx[2] = (1 / J) * (k2 * (x[3] - R * x[1]) * R - k1 * x[1] - c * x[2]);
    dx[3] = x[4];
    dx[4] = (1 / m2) * (f + m2 * g - k2 * (x[3] - R * x[1]));
end

# initial values  početne vrednosti (kezdeti értékek):
x0 = [0.0, 0.0, 2.0, 0.0];

# time interval  vremenski interval (idő intervallum):
t = (0.0, 20.0);

# parameters  parametri (paraméterek):
p = (10.0, 5.0, 10.0, 15.0, 10.0, 1.0, 9.81);

# defining a differential equation using the package 'DifferentialEquations'
# definisanje diferencijalne jednačine pomoću paketa 'DifferentialEquations'
# differenciális egyenlet létrehozása a 'DifferentialEquations' csomag segítségével
prob = ODEProblem(sistem!, x0, t, p);

# solution of the differential equation using the package 'DifferentialEquations'
# rešenje diferencijalne jednačine pomoću paketa 'DifferentialEquations'
# differenciális egyenlet megoldása a 'DifferentialEquations' csomag segítségével
sol = solve(prob);

# finding angular position in sol.u solution  pronalaženje ugaone pozicije u rešenju sol.u (szögpozíció meghatározása a sol.u-ban):
θ = [x[1] for x in sol.u];

# print the value of the angular position of the first body  ispis vrednosti ugaone pozicije prvog tela (az első test szöghelyzetének értékeinek kiírása):
#println(θ);println(); # uncomment to see  odkomentarisati da se prikaže (kitörölni a kommentet, hogy megjelenjen)

# finding angular velocity in sol.u solution  pronalaženje ugaone brzine u rešenju sol.u (szögsebesség meghatározása a sol.u-ban):
ω = [x[2] for x in sol.u];

# print the angular velocity values of the first body  ispis vrednosti ugaone brzine prvog tela (az első test szögsebességének értékeinek kiírása):
#println(ω);println(); # uncomment to see  odkomentarisati da se prikaže (kitörölni a kommentet, hogy megjelenjen)

# calculating angular acceleration  izračunavanje ugaonog ubrzanja (a szöggyorsulás kiszámítása):
α = diff(ω) ./ diff(sol.t);
println("The acceleration of the first body is : $α\n");

# drawing solutions  crtanje rešenja (a megoldás grafikus ábrázolása):
plot(sol.t, [θ, ω], lw=2, label=["θ(t)" "ω(t)"])
plot!(sol.t[1:end-1], α, lw=2, label="α(t)")


# example 2 :
# the function that generates the input signal  funkcija koja generiše ulazni signal (a bemeneti jelet generáló függvény):
function inputSignal(t)
    tp = rem.(t, 3);
    y = (-1 / 3 * t .+ 5) .* (tp .< 2);
end

function sistem!(dx, x, p, t)
    m1, m2, c, k1, k2, R, g = p;
    J = 1 / 2 * m1 * (R^2);
    f = inputSignal(t);
    dx[1] = x[2];
    dx[2] = (-1 / J) * (k2 * (x[3] + R * x[1]) * R + c * R^2 * x[2]);
    dx[3] = x[4];
    dx[4] = (1 / m2) * (m2 * g - f - k1 * x[3] - k2 * (x[3] + R * x[1]));
end

x0 = [0.0, 0.0, 0.0, 0.0];

t = (0.0, 15.0);

p = (10.0, 5.0, 10.0, 15.0, 10.0, 1.0, 9.81);

prob = ODEProblem(sistem!, x0, t, p);
sol = solve(prob);

# finding the angular position of second body in sol.u solution  pronalaženje ugaone pozicije drugog tela u rešenju sol.u (a második test szöghelyzetének megtalálása a sol.u-ban):
x = [x[3] for x in sol.u];

# determination of the total distance traveled by another body  određivanje ukupnog pređenog puta drugog tela (a második test által megtett távolság meghatározása):
r = sum(abs.(diff(x)));
println("The second body's path is : $r");println();

# finding the angular position of the first body in sol.u solution  pronalaženje ugaone pozicije prvog tela u rešenju sol.u (az első test szöghelyzetének megtalálása a sol.u-ban):
θ = [x[1] for x in sol.u];

# finding the angular velocity of the first body in sol.u solution  pronalaženje ugaone brzine prvog tela u rešenju sol.u (az első test szögsebességének megtalálása a sol.u-ban):
ω = [x[2] for x in sol.u];

plot(sol.t, [θ, ω], lw=2, label=["θ(t)" "ω(t)"])


# example 3 :
# function that creates a differential equation  funkcija koja kreira diferencijalnu jednačinu (differenciális egyenletet létrehozó függvény):
function sistem!(dx, x, p, t)
    m, c1, c2, k1, k2, g = p;
    f = sin(t);
    dx[1] = x[2];
    dx[2] = (1 / m) * (m * g - k1 * x[1] - k2 * (x[1] - x[3]) - c1 * x[2]);
    dx[3] = (k2 * (x[1] - x[3]) - 3 * f) / (9 * c2);
end

x0 = [-1.0, 0.0, 0.0];

t = (0.0, 100.0);

p = (10.0, 10.0, 10.0, 15.0, 10.0, 9.81);

prob = ODEProblem(sistem!, x0, t, p);
sol = solve(prob);

# finding the angular velocity of the first body in sol.u solution  pronalaženje ugaone brzine prvog tela u rešenju sol.u (az első test szögsebességének megtalálása a sol.u-ban):
v = [x[2] for x in sol.u];

plot(sol.t[sol.t .<= 20], v[sol.t .<= 20], label="v(t)", lw=2)

# finding the angular position of the first body in sol.u solution  pronalaženje ugaone pozicije prvog tela u rešenju sol.u (az első test szöghelyzetének megtalálása a sol.u-ban):
x1 = [x[1] for x in sol.u];

# finding the angular position of second body in sol.u solution  pronalaženje ugaone pozicije drugog tela u rešenju sol.u (a második test szöghelyzetének megtalálása a sol.u-ban):
x2 = [x[3] for x in sol.u];

plot(sol.t, [x1, x2], label=["x1(t)" "x2(t)"], legend=:bottomright, lw=2, yticks=-1:6)