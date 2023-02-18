# INTRODUCTION AND EXAMPLES OF SOLVING THE SYSTEMS DESCRIBED BY THE TRANSMISSION FUNCTION

using ControlSystems;
using Plots;

# Introduction to solving  uvod u rešavanje (bevezetés a megoldásba) :
# Serial connection definition  definicija serijske veze (soros kapcsolat definíciója):
G1 = tf(1, [1, 1]);
G2 = tf(1, [1, 2]);
Gek = series(G1, G2);
println("Serial connection : $Gek");println();

# Definition of a parallel connection  definicija paralelne veze (párhuzamos kapcsolat meghatározása):
Gpek = parallel(G1, G2);
println("Parallel connection : $Gpek");println();

# The definition of feedback  definicija povratne sprege (a visszakapcsolás meghatározása):
Gek = feedback(G1,  G2);
println("Positive feedback : $Gek");
Gekv = feedback(G1, -G2);
println("Negative feedback : $Gekv");println();println();


# EXAMPLES :

# Systems with one entrance and one exit  sistemi sa jednim ulazom i jednim izlazom (egy bemenettel és egy kimenettel rendelkező rendszerek) :
# example 1 :
G1 = tf(1, [1, 1]);
G2 = tf(1, [1, 2]);
G3 = tf(1, [1, 3]);
H = tf(1, [1, 0]);
G12 = parallel(G1, G2);
G123 = series(G12, G3);
Gekv1 = feedback(G123, H);
println("Solution : $Gekv1");println();println();


# example 2 :
G1 = tf(1, [1, 1]);
G2 = tf(1, [1, 2]);
G3 = tf(1, [1, 3]);
G4 = tf(1, [1, 4]);
G23 = minreal(series(G2, G3));
G234 = minreal(feedback(G23, G4));
G1234 = minreal(series(G1, G234));
Gevk2 = minreal(feedback(G1234, 1));
println("Solution : $Gevk2");println();println();


# example 3 :
G1 = tf(1, [1, 1]);
G2 = tf(1, [1, 2]);
G3 = tf(1, [1, 3]);
G4 = tf(1, [1, 4]);
G5 = tf(1, [1, 1]);
G6 = tf(1, [1, 4]);
G12 = minreal(feedback(G1, -G2));
G56 = minreal(parallel(G5, G6));
G123 = minreal(series(G12, G3));
G12356 = minreal(feedback(G123, G56));
G123456 = minreal(series(G12356, G4));
Gekv3 = minreal(feedback(G123456, -1));
println("Solution : $Gekv3");println();println();


# Multivariable systems  multivarijabilni sistemi (többváltozós rendszerek) :
# example 1 :
# function that solves the system  funkcija koja rešava sistem (egy függvény, amely megoldja a rendszert):
function sistem()
    G1 = tf(10, [1, 10]);
    G2 = tf([5, 2], [1, 2, 1, 0]);
    G3 = tf(5);
    G4 = tf([1, 0.1], [1, 0.05]);
    # W11 -> U1, Y => active first input and output  aktivan prvi ulaz i izlaz (az első bemenet és a kimenet aktív)
    G34 = minreal(series(G3, G4));
    G234 = minreal(feedback(G2, G34));
    W11 = minreal(parallel(-G1, G234));
    # W12 -> U2, Y => active second input and output  aktivan drugi ulaz i izlaz (a második bemenet és a kimenet aktív)
    G24 = minreal(series(-G2, G4));
    W12 = minreal(feedback(G24, -G3));
    return W11, W12;
end

W11, W12 = sistem();
println("Solution for U1 : $W11");println();
println("Solution for U2 : $W12");

# Simulation  simulacija (szimuláció) :
t = 0:0.01:5; # time interval  vremenski interval (idő intervallum)
u1 = sin.(t); # signal of the first input  signal prvog ulaza (az első bemenet jele)
u2 = cos.(t); # signal of the second input  signal drugog ulaza (a második bemenet jele)

# solution  rešenje (megoldás):
y1, ~, ~ = lsim(W11, u1', t);
y2, ~, ~ = lsim(W12, u2', t);
y = y1 .+ y2;

# drawing solutions  crtanje rešenja (a megoldás kirajzolása):
plot(t, [y', u1, u2], label=["y(t)" "u1(t)" "u2(t)"], xlabel="t", lw=2, title="Example 1")


# example 2 :
# function that solves the system  funkcija koja rešava sistem (egy függvény, amely megoldja a rendszert):
function sistem(k1, k2)
    G1 = tf(2, [0.2, 1]);
    G2 = tf([1.2, 1], [1, 2, 0.1]);
    G3 = tf(4, [1, 3, 2]);
    G4 = tf(1, [0.1, 1]);
    K1 = tf(k1);
    K2 = tf(k2);
    # W11 -> U1, Y => active first input and output  aktivan prvi ulaz i izlaz (az első bemenet és a kimenet aktív)
    G12 = minreal(series(G1, G2));
    G32 = minreal(feedback(G3, K2));
    G324 = minreal(series(G32, G4));
    G3241 = minreal(series(K1, -G324));
    Gp = minreal(parallel(tf(1), -G3241));
    W11 = minreal(series(G12, Gp));
    # W12 -> U2, Y => active second input and output  aktivan drugi ulaz i izlaz (a második bemenet és a kimenet aktív)
    G32 = minreal(feedback(G3, K2));
    W12 = minreal(series(G32, -G4));
    return W11, W12;
end

# function that describes the behavior of K1 and K2  funkcija koja opisuje ponašanje K1 i K2 (K1 és K2 viselkedését leíró függvény):
function K1K2(k1_vals, k2_vals, u1, u2, t)
    y_vals = [];
    for k1 in k1_vals
        for k2 in k2_vals
            W11, W12 = sistem(k1, k2);
            y1, ~, ~ = lsim(W11, u1', t);
            y2, ~, ~ = lsim(W12, u2', t);
            y = y1 .+ y2;
            push!(y_vals, y');
        end
    end
    return y_vals;
end

# Simulation  simulacija (szimuláció) :
t = 0:0.01:10; # time interval  vremenski interval (idő intervallum)
u1 = sin.(t); # signal of the first input  signal prvog ulaza (az első bemenet jele)
u2 = cos.(t); # signal of the second input  signal drugog ulaza (a második bemenet jele)
k1 = [0.1, 0.3, 0.7]; # values of K1  vrednosti K1 (a K1 értékei)
k2 = [0.2, 0.5]; # values of K2  vrednosti K2 (a K2 értékei)

# solution  rešenje (megoldás):
y = K1K2(k1, k2, u1, u2, t);

# drawing solutions  crtanje rešenja (a megoldás kirajzolása):
plot(t, y, lw=2, xticks=0:2:10, xlabel="t", title="Example 2")