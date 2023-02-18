# INTRODUCTION TO THE PACKAGE 'ControlSystems'

using ControlSystems;
using Plots;

# Definition of model in state space  definicija modela u prostoru stanja (modell meghatározása a térben) :
A = [0 1; 0 -12.5];
B = [0; 38.9];
C = [0 1];
D = 0;
model = ss(A, B, C, D);
println("Model in state space : $model");println();

Ts = 0.025;
E = [1 0.02147; 0 0.73160];
F = [0.01098; 0.83520];
C = [0 1];
D = 0;
model1 = ss(E, F, C, D, Ts);
println("Model in state space : $model1");println();

# Definition of the transmission function described by the quotient of the polynomial  definicija funkcije prenosa opisane količnikom polinoma (polinom hányadossal leírt átviteli függvény) :
P = [38.9];
Q = [1.0, 5.0, 6.0];
G = tf(P, Q);
println("Transmission function described by the quotient of the polynomial : $G");println();

s = tf("s");
K = 38.9 / (s^2 + 5 * s + 6);
println("Transmission function described by the quotient of the polynomial : $K");println();

# Definition of transmission function described over zeros, poles and amplifications  definicija funkcije prenosa opisane preko nula, polova i pojačanja (nullákkal, pólusokkal és erősítésekkel leírt átviteli függvény) :
zeros = [];
poles = [-2, -3];
amplifications = 38.9;
X = zpk(zeros, poles, amplifications);
println("Transmission function described over zeros, poles and amplifications : $X");println();

G = tf([1, 1], [1, 3, 2]);
z, p, k = zpkdata(G);
println("Transmission function described over zeros, poles and amplifications : $z, $p, $k");println();

# Matrix of the system transmission function with two inputs and two outputs  matrica funkcije prenosa sistema sa dva ulaza i dva izlaza (rendszerátviteli funkció mátrixa két bemenettel és két kimenettel) :
W = [tf(1, [2, 3]) tf(1, [1, 0]); tf(10, [3, 1]) tf(1, [1, 2, 3])];
println("$W");println();println();


# Model conversions  konverzije modela (modellkonverziók) :
G1 = tf(1, [1, 2, 1]);
println(G1);println();
G2 = zpk(G1);
println(G2);println();
sys = ss(G1);
println(sys);println();


# Analysis of model behavior  analiza ponašanja modela (a modell viselkedésének elemzése) :
# unit response  jedinični odziv (egység bemeneti jelre):
G = tf(38, [1, 5, 6]);
y, t, x = step(G, 5);
plot(t, x', label=["x1(t)" "x2(t)"], lw=2, xlabel="t", ylabel="x(t)", title="Unit response")

# impulse response  impulsni odziv (impulzus bemeneti jelre):
G = tf(38, [1, 5, 6]);
y, t, x = impulse(G, 5);

plot(t, y', label="y(t)", lw=2, xlabel="t", ylabel="y(t)", title="Impulse response")

# system response to forwarded incentive  odziv sistema na prosleđenu pobudu (a megadott bemeneti jelre):
function inputSignal(t)
    return abs.(sin.(pi / 3 * t));
end

G = tf(38.9, [1, 5, 6]);
t = 0:0.01:12;
u = inputSignal(t);
y, t, x = lsim(G, u', t);

plot(t, x', label=["x1(t)" "x2(t)"], lw=2, xlabel="t", xticks=0:12, title="System response to forwarded incentive inputSignal(t)")
plot!(t, u, label="u(t)", lw=2, xticks=0:12)