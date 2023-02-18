# A FEW EXAMPLES OF SOLVING ELECTRICAL NETWORKS

using ControlSystems;
using Plots;

# EXAMPLES :

# example 1 :
# function that describes an electrical network  funkcija koja opisuje električno kolo (az elektromos áramkört leíró függvény):
function modelOfElectricalNetwork(R, L, C)
    s = tf("s");
    Zr = R;
    Zl = s * L;
    Zc = 1 / (s * C);
    Zekv = ((Zc + Zr) * Zr) / (Zc + 2 * Zr);
    return minreal(Zekv / (Zekv + Zl));
end

# variables  promenljive (változók):
R = 100; # resistance  otpornost (ellenállás)
L = 0.022; # inductance  induktivnost (induktivitás)
C = 4.7 * 10^-7; # capacitance  kapacitivnost (kapacitás)

G = modelOfElectricalNetwork(R, L, C);
# printing of electrical network solutions  ispis rešenja električnog kola (elektromos áramkör megoldásának kiírása):
println("Electrical network solutions : $G");println();println();

t = 0:0.01:10; # time interval  vremenski interval (idő intervallum)
u = abs.(sin.(t)); # input signal  ulazni signal (bemeneti jel)

y_step, t, x = step(G, t);
y_sin, t, x = lsim(G, u', t);

# drawing solutions  crtanje rešenja (a megoldások kirajzolása):
plot(t, y_step', lw=2, xticks=0:10, label="y_step", title="Example 1")
plot!(t, y_sin', lw=2, label="y_sin")

# example 2 :
# function that describes an electrical network  funkcija koja opisuje električno kolo (az elektromos áramkört leíró függvény):
function modelOfElectricalNetwork(R, L, C)
    ssA = [-R/L -1/L; 1/C -1/(R * C)];
    ssB = [1/L -1/L; 0 -1/(R * C)];
    ssC = [0 1/R; 0 1];
    ssD = [0 1/R; 0 1];
    return ss(ssA, ssB, ssC, ssD);
end

# variables  promenljive (változók):
R = 1000; # resistance  otpornost (ellenállás)
L = 0.022; # inductance  induktivnost (induktivitás)
C = 4.7 * 10^-7; # capacitance  kapacitivnost (kapacitás)

EKV = modelOfElectricalNetwork(R, L, C);
# printing of electrical network solutions  ispis rešenja električnog kola (elektromos áramkör megoldásának kiírása):
println("Electrical network solutions : $EKV");

t = 0:0.01:10; # time interval  vremenski interval (idő intervallum)
u = sin.(t); # input signal  ulazni signal (bemeneti jel)

y, t, x = lsim(EKV, [u u]', t);

# drawing solutions  crtanje rešenja (a megoldások kirajzolása):
p1 = plot(t, y[1, :], lw=2, label="i1(t)", xlabel="t", title="Example 2")
p2 = plot(t, y[2, :], lw=2, label="u0(t)", xlabel="t")
plot(p1, p2, layout=(2, 1))