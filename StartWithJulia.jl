# JULIA

# Hello World in Julia :
println("Hello World!");
print("Hello World!\n");

# Variables  promenljive (változók) :
# integer  ceo broj (egész számok):
a = 1;
b = 159;
c = 55;
d = 12445675674252;
println(a);
println(b);
println(c);
println(d);

# double   realan broj (valós számok):
a = 5.1365;
b = 1.0;
c = 0.456456;
d = 0.00000000000056;
println(a);
println(b);
println(c);
println(d);

# small number   jako mali broj (nagyon kicsi számok):
smallN = 1.602e-19;
println(smallN);

# big number   jako velik broj (nagyon nagy számok):
bigN = 1.989e30;
println(bigN);

# character   slovo/znak (betű/karakter):
char = 'a';
char1 = '!';
char2 = 'X';
println(char);
println(char1);
println(char2);

# string   tekst (szöveg):
Sstring = "Something";  # string is immutable!!
Ttext = "Julia is a high-level, dynamic programming language. Its features are well suited for numerical analysis and computational science.";
println(Sstring);
println(Ttext);

# array   niz/vektor (vektor/tömb):
array = [12, 15, 22, 20, 17, 9];
array1 = [12 15 22 20 17 9];
a1 = [12, 55];
a11 = [12 55];
a2 = [10.11, 13.1142, 55.654, 69.68987];
a3 = ['a', 'b', 'c', 'd'];
a4 = ["MIKI", "NIKI", "FIKI", "KIKI"];
a5 = [13, 6.55478, "ABCDEFG", 'a'];
a6 = ['f', 6.55478, 15353, [1, 2, 4, 7]];
a7 = [1.154, 2.54, NaN, Inf, nothing];
println(array);
println(array1);
println(a1);
println(a11);
println(a2);
println(a3);
println(a4);
println(a5);
println(a6);
println(a7);

# collection   opsezi (gyűjtemények):
o = collect(3:9);
o1 = collect(1:10);
o2 = collect(1:99);
println(o);
println(o1);
println(o2);

# tuple   torke (tömb):
T = (12, 15, 22, 20, 17, 9);
T1 = (1, 2, 3);
T2 = (1, 2.2423, 'A', "trararara");
T3 = (1.154, 2.54, NaN, Inf, nothing);
println(T);
println(T1);
println(T2);
println(T3);

# matrix   matrica (mátrix) :
Mmatrix = [ 11  12  13  14  15
            21  22  23  24  25
            31  32  33  34  35 ];

Nmatrix = [1 2 3; 4 5 6; 7 8 9];
Smatrix = [1 2 3; 4.54 5.588 6.488; 'a' 'b' 'c'; "daar" "adrwefs" "tersdfa"];
Tmatrix = [1 2 3; NaN Inf nothing];
Boolmatrix = [true false false true; false true true false];
println(Mmatrix);
println(Nmatrix);
println(Smatrix);
println(Tmatrix);
println(Boolmatrix);

# dictionary   rečnik (szótár):
stud = Dict(123=>"Pera", 125=>"Mika", 201=>"Laza");
println(stud);

# special values   posebne vrednosti (különleges értékek):
# pi - 3.1415...
# im - imaginary unit using for complex numbers  imaginarna jedinica (imagináris rész)
# NaN - not a number  nije broj (nem szám)
# Inf - infinity  beskonačno (végtelen)
# nothing - nothing  ništa (semmi)
# global - koristi se za promenu vrednosti globalne promenljive (globális változó értékének módosítására használják)

# complex numbers  kompleksni brojevi (komplex számok)
complexN = -4 + 7im;
complexN1 = -13im;
complexN2 = -3 - 2im;
println(complexN, complexN1, complexN2);

# some interesting character  neki zanimljivi karakteri (néhány érdekes karakter):
# π - pí  --> \piTAB
# α - alpha --> \alphaTAB
# β - beta --> \betaTAB
# ω - omega --> \omegaTAB
# θ - teta --> \tetaTAB
# ≠ - not equal  jednako (egyenlő) --> \neTAB
# ≥ - greater equal to  veće jednako (nagyobb egyenlő) --> \geTAB
# ≤ - less equal to  manje jednako (kissebb egyenlő) --> \leTAB
println("π, α, β, θ, ω, ≠");


# Operators  operatori (operátorok) :
# arithmetic operators   aritmetički operatori (aritmetikai operátorok):
# + , -, *, /, \, ^, %, ÷
a = 10;
b = 5;
c = 5;
println("a + b = $(a+b)");
println("a - b = $(a-b)");
println("a * b = $(a*b)");
println("a / b = $(a/b)");
println("b / a = $(a\b)");
println("a^b = $(a^b)");
println("a % b = $(a%b)");
println("a ÷ b = $(a÷b)");

# updating operators   operatori ažuriranja (értéket változtató operátorok):
# +=, -=, *=, /=, \=, %=, ^=, &=, |=, ⊻=, >>>=, >>=, <<=
println("a + b = $(a+=b)");
println("a - b = $(a-=b)");
println("a * b = $(a*=b)");
println("a / b = $(a/=b)");
println("b / a = $(a\=b)");
println("a^b = $(a^=b)");
println("a % b = $(a%=b)");

# bitwise operators   operatori nad bitima (bitenkénti operátorok):
# ~, &, |, >>>, >>, <<, nand(⊼), nor(⊽), xor(⊻)
x = 123;
y = 124;
println("~x = $(~x)"); # not  negacija (tagadás)
println("x & y = $(x&y)"); # and  logička operacija i (logikai és)
println("x | y = $(x|y)"); # or  logička operacija ili (logikai vagy)
println("x ⊼ y = $(x⊼y)");  # println(nand(x, y)); # nand  logička operacija ni (logikai nem és)
println("x ⊽ y = $(x⊽y)");  # println(nor(x, y));  # nor  logička operacija nili (logikai nem vagy)
println("x ⊻ y = $(x⊻y)");  # println(xor(x, y)); # xor  logička operacija ekskluzivno ili (logikai kizárólagos vagy)
println("x >> y = $(x>>2)"); # arithmetic shift right  aritmetičko pomeranje desno (aritmetikai jobbra tolás)
println("x << y = $(x<<2)"); # logical/arithmetic shift left  logičko/aritmetičko pomeranje levo (aritmetikai/logika balra tolás)
println("x >>> y = $(x>>>2)"); # logical shift right  logičko pomeranje desno (logikai jobbra tolás)

# boolean operators    logički operatori (logikai operátorok):
# !, &&, ||
println(!true);
println(true && true);
println(true && false);
println(true || true);
println(false || true);

# relational operators   relacioni operatori (relációs operátorok):
# <, <=, >, >=, ==, !=
println("a < b = $(a<b)");
println("a <= b = $(a<=b)");
println("a > b = $(a>b)");
println("a >= b = $(a>=b)");
println("a == b = $(a==b)");
println("b == c = $(b==c)");
println("b != a = $(a!=b)");

# vectorized "dot" operators   operator za vektore/matrice (tömb/mátrix operátorok):
# .+, .-, .*, ./, .\, .%, .<, .<=, .>, .>=, .==, .^
A = [1, 10, 20, 30];
B = [3, 9, 20, 23];
println("A + 2 = $(A.+2)");
println("A - 2 = $(A.-2)");
println("A * 2 = $(A.*2)");
println("A / 2 = $(A./2)");
println("A % 2 = $(A.%2)");
println("A ^ 2 = $(A.^2)");
println("A < 2 = $(A.<2)");
println("A == 2 = $(A.==2)");
println("A + B = $(A.+B)");
println("A * B = $(A.*B)");
println("A > B = $(A.>B)");
println("A == B = $(A.==B)");


# Function   funkcije (funkciók/függvények) :
function retF()
    return 5;   # function that has a single return value  funkcija koja ima jednu povratnu vrednost (függvény, melynek csak egy visszatérő értéke van)
end

println("x = $(retF())");

function change!(x)
    x[1] = -1;  # function that changes the value of a parameter  funkcija koja menja vrednost parametra (függvény, mely megváltoztatja a paraméter értékét)
end
  
a = [1, 2, 3]
change!(a);
println("a = $a");

function retTuple()
    return 12.6, 55, "Rock";    # function that returns more than one return value  funkcija koja vraća više povratnih vrednosti (függvény, melynek több visszatérő értéke van) 
end

f, g, h = retTuple();
println("f = $f , g = $g , h = $h");

# recursion  rekurzija (rekurzió)
function fact(n)
    if !(n isa Int64)
        error("Not int!")
    elseif n < 0
        error("Must be grater than zero!")
    elseif n == 0
        return 1
    else
        return n * fact(n-1)
    end
end
  
println("Factorial of 10 is : $(fact(10))");


# If branch  grananje (elágazások) :
if (100 > 15)
    println("True");
end

# If-else branch  grananje (elágazások) :
if (100 < 15)
    println("True");
else
    println("False");
end

# If-elseif-else branch  grananje (elágazások) :
i = 20
if (i == 10)
    println("Value of i is 10");
elseif(i == 15)
    println("Value of i is 15");
elseif(i == 20)
    println("Value of i is 20");
else
    println("Value of i is not defined");
end


# For loop  for petlja (for ciklus) :
x = [11, 22, 33, 11];
function mySum(x)
    s = 0.0;
    for i in x
        s += i;              
    end
    return s;
end

println("Sum is $(mySum(x))");

function myCount(x)
    c = 0;
    for i in 1:length(x)
        c += 1;              
    end
    return c;
end

println("Number of element of x is $(myCount(x))");

function numberOfWords(sentens, char)
    n = 0
    for s ∈ sentens
        if s == char
            n += 1
        end
    end
    n
end

println("Number od 'a' in Banana is : $(numberOfWords("Banana",'a'))");

a = 0;
for i in eachindex(x)
    if x[i] == 11
        global a += 1;
    end
end

println("Number of 11 in array x is : $a");

o = [1];
A = [1, 10, 6, 1, 22, 59, 1, 13, 11, 1];
y = [o for x in A];
println(y);

# two nested for loops  dve ugnježdene for petlje (két beágyazott for ciklus):
A = zeros(Int,6,6);
for i=1:6, j=1:6
    A[i,j] = j > i ? 0 : j 
end

println(A);


# While loop  while petlja (while ciklus) :
s = 0;
while s < length(x)
    global s += 1;  
end

println("Number of element of x is $s");


# Exceptions  izuzeci (kivételek) :
try
    X = [1 2];
    Y = [3 4];
    Z = X * Y;
catch e
    if isa(e, DimensionMismatch)
        println("Dimension Mismatch!");
    end
end


# Working with strings  rad sa stringovima (szöveggel való variálás) :
# string concatenation  spajanje stringova (szöveg összekapcsolása):
s = "Some written text";
println(s * "and a small addition" * "and a little more.");

# indexing srtings  indeksiranje tektsa (szöveg részeihez való hozzáférés):
println(s[1]);
println(s[1:5]);
println(s[14:end]);
println(s[1:2:end]);

# unicode words  unicode reči (unicode szavak):
s = "ћевапчићи";
index1 = firstindex(s);
index2 = nextind(s, index1);
println("$index1 , $index2");

# get type of variables  tip promenljive (változó tipusának megállapítása):
println(typeof(s));

# get length of words  dužina teksta (szöveg hossza):
println(length(s));


# Working with arrays  rad sa nizovima/vektorima (tömbökkel való variálás) :
A1 = [1, 10, 6, 18, 22, 59, 99, 13, 11, 41];

# indexing arrays  indeksiranje nizovima/vektorima (tömbök részeihez való hozzáférés):
println(A1[1]);
println(A1[1:3:end]);
println(A1[1:end]);
println(A1[end]);
println(A1[end-2]);
B1 = [1, 2, 3, 4, 5];
barray = [true, false, false, true, false]; # indexing with bool array  indeksiranje preko maske (idekszelés maszk segítségével)
println(B1[barray]);

# get type of array  tip promenljive (változó tipusának megállapítása):
B2 = [13.34345, 55.586856];
println("Tipe of A1 is : $(typeof(A1))");
println("Tipe of B1 is : $(typeof(B1))");
println("Tipe of barray is : $(typeof(barray))");

# get length of array  dužina niza/vektora (tömb hossza):
println("Lenght is : $(length(A1))");
println("Size is : $(size(A1))");
println("Sizeof is : $(sizeof(A1))");

# some functions for arrays  neke funkcije za nizove/vektore (néhány funkció a tömbökkel való munkához):

# find the maximum in a array  pronalaženje maksimuma u nizu (maksimum megtalálása a tömbben)
println("Maximum in array A is : $(maximum(A1))");

# find the minimum in a array  pronalaženje minimum u nizu (minimum megtalálása a tömbben)
println("Minimum in array A is : $(minimum(A1))");

# some mathematical functions  nekoliko matematičkih funkcija (néhány matematika funkció)
println(log2.(A1));
println(sin.(A1));
println(cos.(A1));
println(tan.(A1));
println(log.(A1));

# add an element to the end of the array  dodavanje elementa na kraj niza (új elem hozzáadása a tömb végére)
push!(A1,9);
println(A1);

# retrun the last element from the array  skidanje poslednjeg elementa iz niza (a tömb utolsó elemének eltávolítása)
println(pop!(A1));

# retrun the first element from the array  skidanje prvog elementa iz niza (a tömb első elemének eltávolítása)
println(popfirst!(A1));

# remove an element from the array from the specified position  skidanje elementa iz niza sa zadate pozicije (tömb elemének eltávolítása a megadott helyről)
println(popat!(A1,3));

# add an element to the specified position to the array  dodavanje elementa u niza na zadatu poziciju (új elem hozzáadása a tömbhöz a megadott helyre)
append!(A1,[7, 6]);
println(A1);

# sort the array  sortiranje niza (tömb sorba rendezáse)
println("A1 sorted : $(sort(A1))");

# return the sum of array  određuje sumu niza (a tömb elemeinek összege)
println("Sum of A1 : $(sum(A1))");

# determines the number of array elements  određuje broj elemeneta niza (meghatározza a tömbelemek számát)
println("Count of barray : $(count(barray))");

# copying elements od A1 to B  kopira elemente A1 u B (az A1 elemeit átmásolja a B-be)
B = copy(A1);

# copying everything from A1 to B  kopira sve iz A1 u B (az A1 átmásol mindent a B-be)
B = deepcopy(A1);


# Working with matrix  rad sa matricama (mátrixokkal való variálás) :
# indexing matrix  indeksiranje matrica (mátrixok részeihez való hozzáférés):
Amatrix = [ 11  12  13  14  15
            21  22  23  24  25
            31  32  33  34  35 ];

A1matrix = [ 23  2  55  4  11
             65  3  18  52  25
             33  8  2  1  99 ];

Bmatrix = [1 2 3; 4 5 6; 7 8 9];

# indexing matrix  indeksiranje matrica (mátrix részeihez való hozzáférés):
println(Bmatrix[1,1]);
println(Bmatrix[:,1]);
println(Bmatrix[1,:]);
println(Amatrix[1:2:end,2:1:end]);
println(Bmatrix[:,:]);
println(Bmatrix[end,end]);
boolMatrix = [false true false; true false false; true true false];
println(Bmatrix[boolMatrix]);
println(Bmatrix[Bmatrix.==5]);

# get length of matrix  dužina/veličina matrica (mátrix hossza/nagysága):
println("Lenght of Amatrix is : $(length(Amatrix))");
n,m = size(Amatrix);
println("n = $n, m = $m");
n1 = size(Amatrix,1);
m1 = size(Amatrix,2);
println("n1 = $n1, m1 = $m1");

# some mathematical functions  nekoliko matematičkih funkcija (néhány matematika funkció)
println(log2.(Bmatrix));
println(sin.(Bmatrix));
println(cos.(Bmatrix));
println(tan.(Bmatrix));
println(log.(Bmatrix));

# some functions for matrix  neke funkcije za matrice (néhány funkció a mátrixokkal való munkához):
using LinearAlgebra, Statistics;
# merging matrix  spajanje matrica (több mátrix egybe csoportosítása):
Q = [Amatrix  Bmatrix];
println(Q);

# transposing  transponovanje (traszpozíció):
println("Transposing of matrix A is : $Amatrix'");

# merge by columns  spajanje po kolonama (csoportosítás az oszlopok alapján):
K = hcat(Amatrix, A1matrix, 10*Amatrix);
println("Merge Amatrix by columns : $K");

# merge by rows  spajanje po vrstama (csoportosítás a sorok alapján):
A = [1 2; 3 4];
R = vcat(A, A^2, A);
println("Merge matrix A by rows : $R");

# merge matrix with specified function  proširenje matrice sa definisanim izrazom (mátrix bővítése a megadott szabály alapján):
println("New matrix is : $(cat(Bmatrix, 10*Bmatrix, dims=2))");

# repeat rows and columns by number  umnožavanje vrstama i po kolonama (sorok és oszlopok ismétlése a megadott számszor):
M = repeat(A,2,4);
println("Repeat number of rows by 2 and number of columns by 4 : $M");

# zero matrix  matrica nula (mátrix mely minden eleme nulla):
Zmatrix = zeros(Int,3,3);
println("Matrix of full zeros : $Zmatrix");

# matrix of ones  matrica jedinica (mátrix mely minden eleme egyes):
Omatrix = ones(Int,3,3);
println("Matrix of full ones : $Omatrix");

# matrix of random numbers  matrica random vrednosti (mátrix mely minden eleme véletlen szám):
Rmatrix = rand(Int,3,3);
println("Matrix of full ones : $Rmatrix");

# unit matrix  jedinična matrica (egységmátrix):
println("Unit matrix : $I");

# determinant of the matrix  determinanta matrice (determináns):
println("Determinant of matrix A is : $(det(A))");

# inverse matrix  inverzna matrica (inverz mátrix):
println("Inverse matrix of A is : $(inv(A))");

# matrix diagonal  dijagonala matrice (diagonális mátrix):
D = diag(Bmatrix);
println("Diagonal of Bmatrix is : $D");

# upper triangular matrix  gornja trougaona matrica (felső háromszög mátrix):
println("Upper triangular matrix of B is : $(triu(Bmatrix))");

# lower triangular matrix  donja trougaona matrica (alsó háromszög mátrix):
println("Lower triangular matrix of B is : $(tril(Bmatrix))");

# factorization  faktorizacija (faktorizáció):
L, U = factorize(Amatrix);
println("Lower triangular matrix of A is : $L");
println("Upper triangular matrix of A is : $U");

# eigenvalues and vectors  svojstveni vrednosti i vektori (sajátértékek és vektorok):
e,v = eigen(A);
println("Eigenvalues is : $e, vectors is : $v");

# sum of full matrix  suma u celoj matrici (a mátrix összes elemének összege):
println("Sum of all elements of matrix is : $(sum(Bmatrix))");

# the sum of the matrix by rows  suma po vrstama (a mátrix soraiban lévő elemek összege):
println("Sum of row elements of matrix is : $(sum(Bmatrix, dims=1))");

# the sum of the matrix by columns  suma po kolonama (a mátrix oszlopaiban lévő elemek összege):
println("Sum of column elements of matrix is : $(sum(Bmatrix, dims=2))");

# sorts by columns  sortiranje po kolonama (mátrix oszlopainak sorba rendezése):
println("Sorts by columns: $(sort(Bmatrix, dims=1))");

# sorts by rows  sortira po vrstama (mátrix sorainak sorba rendezáse):
println("Sorts by rows : $(sort(Bmatrix, dims=2))");

# minimum in matrix  minimum u celoj matrici (a mátrix legkisseb eleme):
println("Minimum of matrix B is : $(minimum(Bmatrix))");

# minimum in rows of matrix  minimum u redovima matrice (a mátrix sorainban lévő legkisseb eleme):
println("Minimum in rows of matrix B is : $(minimum(Bmatrix, dims=1))");

# minimum in columns of matrix  minimum u kolonama matrice (a mátrix oszlopaiban lévő legkisseb eleme):
println("Minimum in columns of matrix B is : $(minimum(Bmatrix, dims=2))");

# maximum in matrix  maximum u celoj matrici (a mátrix legnagyobb eleme):
println("Maximum of matrix B is : $(maximum(Bmatrix))");

# maximum in rows of matrix  maximum u redovima matrice (a mátrix sorainban lévő legnagyobb eleme):
println("Maximum in rows of matrix B is : $(maximum(Bmatrix, dims=1))");

# maximum in columns of matrix  maximum u redovima matrice (a mátrix oszlopaiban lévő legnagyobb eleme):
println("Maximum in columns of matrix B is : $(maximum(Bmatrix, dims=2))");

# find minimum in matrix  nalazi minimum u matrici (a mátrixban lévő legkisseb eleme megkeresése):
minElement, indexOfMinEl = findmin(Bmatrix);
println("Minimum in matrix B is : $minElement, position of min element is : $indexOfMinEl");

# find maximum in matrix  nalazi maximum u matrici (a mátrixban lévő legnagyobb eleme megkeresése):
maxElement, indexOfMaxEl = findmax(Bmatrix);
println("Maximum in matrix B is : $maxElement, position of max element is : $indexOfMaxEl");

# mapping  mapiranje (skálázás):
X = [10, 16, 22, -6, 15, 12];
Y = map(x -> x^3, X);
println("Mapped matrix is : $Y");

f2(x) = exp(-0.1x) * sin(2x);   # mapping with function  mapiranje uz pomoć funkcije (függvénnuel való skálázás)
H = map(f2, X);
println("Mapped matrix is : $H");

# filter  filtriranje (szűrő beállítása):
F = filter(x -> x > 100, Y);
println("Filtered matrix is : $F");

# reduce  redukovanje matrice (mátrix csökkentése):
m = reduce(max, A, dims=1);
println("Reduced matrix is : $m");
s = reduce(+, A, dims=1);
println("Reduced matrix is : $s");

# merging of various matrices  spajanje raznih matrica (kölönböző mátrixok csoportosítás):
T = [12, 15, 22, 20, 17, 9];
V = [55, 60, 62, 80, 77, 78];
NewMatrix = zip(T,V);
println("Tipe of NewMatrix is $(typeof(NewMatrix)), NewMatrix is : $NewMatrix");

# mean of matrix  prosek matrice (mátrix elemeinek átlaga):
println("Mean of matrix A is : $(mean(Amatrix))");

# summing matrices  sabiranje matrica (mátrixok összeadása):
println("Amatrix + A1matrix = $(Amatrix .+ A1matrix)");

# subtract matrices  oduzimanje matrica (mátrixok kivonása):
println("Amatrix - A1matrix = $(Amatrix .- A1matrix)");

# multiplication of the matrix by scalar  množenje matrice skalarom (mátrix szorzása számmal):
println("5 * Amatrix = $(5 * Amatrix)");

# multiply matrices  množenje matrica (mátrixok szorzása):
println("Amatrix * A1matrix = $(Amatrix .* A1matrix)");

# divide matrices  deljenje matrica (mátrixok osztása):
println("Amatrix / A1matrix = $(Amatrix ./ A1matrix)");

# are the matrices the same object in memory  provera da li matrice ukazuju na isti objekat u memoriji (megmutatja hogy a mátrixok ugyan arra az objektumra mutatnak-e a memóriában):
println("Amatrix = A1matrix : $(Amatrix === A1matrix)");


# Structures in julia  strukture u juliji (struktúrák a julia nyelvben) :
# define structure  definisanje strukture (struktúra definiálása):
struct Student
    firstName :: String
    secondName :: String
    nameOfUniversity :: String
    numberOfIndex :: String
    ECTSpoints :: Int32
end

student :: Student = Student("Krisztián", "Tojzán", "Fakultet tehničkih nauka", "PR104/2020", 120);
println("$(student.numberOfIndex) - $(student.firstName) $(student.secondName), $(student.nameOfUniversity), number of ECTS points is $(student.ECTSpoints)");

# array of structures  niz struktura (struktúrák tömbje):
moreStudents = [
    Student("Petar", "Petrović", "Filozofski fakultet", "A13", 86),
    Student("Mile", "Milenković", "Medicinski fakultet", "F41", 180),
    Student("Nina", "Bulatović", "Prirodno matematički fakultet", "FI1", 60),
    Student("Milica", "Milić", "Fakultet tehničkih nauka", "RA100", 91)
];

println("All students in array :");
for i in moreStudents
    println("$(i.numberOfIndex) - $(i.firstName) $(i.secondName), $(i.nameOfUniversity), number of ECTS points is $(i.ECTSpoints)");
end


# Working with dictionary  rad sa rečnikom (szótárral való variálás) :
stud = Dict(123=>"Pera", 125=>"Mika", 201=>"Laza", 19=>"Milica", 13=>"Nina");
# indexing dictionary  indeksiranje rečnika (szótár indekselése):
println("Student with key 125 is : $(stud[125])");
println("Student with key 13 is : $(stud[13])");

# get keys and values of dictionary  prikaz ključeva i vrednosti rečnika (szótár kulcsaihoz és értékeihez való hozzáférés):
println("All keys of dictionary stud : $(keys(stud))");
println("All values of dictionary stud : $(values(stud))");

# another way to make a dictionary  drugi načini kreiranja rečnika (más módszer a szótár létrehozásához):
t = [(123,"Pera"), (125,"Mika"), (201,"Laza")]
stud1 = Dict(t);
println("$(stud1)");

# sort dictionary  sortiranje rečnika (szótár sorba rendezáse):
println("Sort values of dictionary : $(sort(collect(values(stud))))");
println("Sort keys of dictionary : $(sort(collect(keys(stud))))");

# set key of value  podešavanje ključa za neku vrednost (szótár értékéhez való kulcs hozzárendelés):
setindex!(stud1, "Mika", 33);
println("Student with key 33 is : $(stud1[33])");

# merge dictionaries  spajanje više rečnika (több szótár egyesítése):
newDict = merge(stud, stud1);
println(newDict);

# delete object from dictionary  brisanje elementa iy rečnika (elem eltávolítása a szótárból):
delete!(stud1, 123);
println("Student after delete 'Pera' : $(stud1)");

# haskey function  funkcija haskey (haskey funkció):
# check if key present in dictionary  provera da li postoji ključ u rečniku (ellenőrzi létezik-e az adott kulcs a szótárban)
println(haskey(stud, 123));
println(haskey(stud, 300));


# More function and things in julia  još nekoliko funkcija i stvari u juliji (még pár dolog a julia nyelvben) :
# mathematical functions  matematičke funkcije (metematika funkciók):
println("Floor of number 8.243235958 : $(floor(8.243235958))");
println("Round of number 8.243235958 : $(round(8.243235958))");
println("SQRT of number 81 : $(sqrt(81))");
println("Sin of number 123 : $(sin(123))");
println("Cos of number 123 : $(cos(123))");
println("Tan of number 123 : $(tan(123))");
println("Parse of number 3 : $(parse(Float64, "3"))");
println("Big number from number 40 : $(big(40))");
println("Factorial of number 20 : $(factorial(20))");
println("Random numbers : $(rand(1_000_000))");
println("Minimum from numbers : $(min(1, 99, 3, 88, 19, -2))");
println("Maximum from numbers : $(max(1, 99, 3, 88, 19, -2))");
println("Abs from number : $(abs(-2355))");
println("Convert types:");
println("Tipe of 4.0 : $(typeof(4.0))");
println("Tipe of 4.0 : $(typeof(Int64(4.0)))");
println("Tipe of 4 : $(typeof(4))");
println("Tipe of 4.0 : $(typeof(Float64(4)))");
println("Result of 0 / 7 is : $(0/7)");
println("Result of 7 / 0 is :$(7/0)");
println("Result of 7 / inf is : $(7/Inf)");
println("Result of inf / 7 is : $(Inf/7)");
println("Result of inf / inf is : $(Inf/Inf)");
println("Result of 0 / 0 is : $(0/0)");
println("Max value of int8 is : $(typemax(Int8))");
println("Max value of int32 is : $(typemax(Int32))");
println("Max value of int64 is : $(typemax(Int64))");
println("Max value of float64 is : $(typemax(Float64))");


# random values  random vrednosti (véletlenszerű értékek):
using Random;
Random.seed!(1);
for k in shuffle(1:25)
    println(k);
end


# include files  povezivanje/spajanje više fajlova/biblioteka (több fájl összekapcsolása/importálása):
# include("FileName.jl");
# include("FolderName/FileName.jl");
# include("C:/Users/38162/Desktop/JuliaFileName.jl");


# ignoring the return value of the function  ignorisanje povratne vrednosti funkcije (a függvény visszatérési értékének figyelmen kívül hagyása):
# f, ~, ~ = lsim(G, u', t);


# macros in Julia  makroi u Juliji (makrók a Julia programnjelvben):
# @show - it is used to display as a print/pritln  koristi se za prikaz kao print/println (megjelenítésre használják)
# @inbounds - eliminates array bounds checking  eliminiše proveru granica niza (kiküszöböli a tömbhatárok ellenőrzését)
# @simd - annotate a for loop to allow the compiler to take extra liberties to allow loop re-ordering  pomoć kompajleru (segíts a fordítónak)
# @time - printing the time it took to execute  ispisuje vreme koje je potrebno za izvršavanje (a végrehajtáshoz szükséges idő nyomtatása)
# @allocated - returning the total number of bytes allocated during evaluation of the expression  pokazuje koliko bajta je zauzeto za nešto (megmutatja hány bájt lett lefoglalva az adott dologhoz)
# @elapsed - returning the number of seconds it took to execute as a floating-point number  ispisuje vreme koje je potrebno za izvršavanje (a végrehajtáshoz szükséges idő nyomtatása)


# working with polynomials  rad sa polinomima (polinimokkal való variálás):
using Polynomials;
# create polynomials  kreiranje polinoma (polinimok létrehozása):
P = Polynomial([3,2,1]);
println("Polynomial : $P");

# sqrt of polynomials  koreni polinoma (polinom gyökeinek meghatározása):
R = roots(P);
println("SQRT of  P is: $R");

# create polynomials from sqrt  kreiranje polinoma od korena (polinimok létrehozása a gyökökből):
Q = Polynomial([-1, -2]);
println("Polynomial : $Q");


# working with complex numbers  rad sa kompleksnim brojevima (komplex számokkal való variálás):
# create complex numbers  kreiranje kompleksnih brojeve (komplex számokkal létrehozása):
z = -1 + 4im;
println("Complex number : $z");

# the real part of a complex number  realan deo kompleksnog broja (komplex szám reális része):
println("Real part of complex number : $(real(z))");

# the imaginary part of a complex number  imaginaran deo kompleksnog broja (komplex szám imagináris része):
println("Imaginary part of complex number : $(imag(z))");

# conjugation of a complex number  konjugovanje kompleksnog broja (komplex szám konjugációja):
println("Conjugation of complex number : $(conj(z))");
println("Conjugation of complex number : $(z')");

# determination of the angle   određivanje ugla (szög meghatározza):
println("Determination of the angle : $(angle(z))");

# summing complex numbers  sabiranje kompleksni brojeva (komplex számok összeadása):
x = 12 - 7im;
y = -5 + 13im;
println("x + y = $(x + y)");

# subtracting complex numbers  oduzimanje kompleksni brojeva (komplex számok kivonása):
println("x - y = $(x - y)");

# multiplication of complex numbers  množenje kompleksni brojeva (komplex számok szorzása):
println("x * y = $(x * y)");

# dividing complex numbers  deljenje kompleksni brojeva (komplex számok osztása):
println("x / y = $(x / y)");


# example of a 3D values  primer 3D vrednosti (3D értékek):
M1 = [ 3.02 3.11 3.29 4.30      
       1.10 1.33 1.65 2.72 ];
M2 = [ 5.10 5.41 6.12 7.40      
       1.91 1.93 2.15 2.99 ];
M3 = [ 1.21 1.44 1.78 2.22      
       1.29 1.77 2.13 4.19 ];

M = cat(M1, M2, M3; dims=3);
println(M);
d = ndims(M);
println("Dimension of M is $d")
s=size(M);
println("Size of M is $s");
R = sum(M, dims=3);
println("Sum of 3rd dimension is $R");
println("Drop 3rd dimension : $(dropdims(R, dims=3))");
# diagonal 3D variable  dijagonalna 3D promenljiva (a 3D érték átlója):
D3 = [j == i == k ? 1 : 0 for i=1:3, j=1:3, k=1:3];


# nothing in julia  ništa u juliji (semmi a julia nyelvben):
r = nothing;
if isnothing(r)   
    println("r is nothing");
end


# comprehensions  generisanje nizova (tömbök generálása):
a = [2^i for i = 0:10];
println(a);
b = [2^i for i = 0:10 if i < 5];
println(b);


# Drawing graphics  crtanje grafika (grafikonok) :
using Plots;
# drawing a random line  crtanje random linije (random vonal rajzolása):
t = 1:10;
y = rand(10);
plot(t, y, xticks=1:10, lw=2, color=:red)

# sin  sinus (színusz):
t = 0:0.01:10;
y = sin.(t);
plot(t, y, title="sin(t)", label="sin(t)", lw=4, color=:red, xticks=0:10)
xlabel!("x")
ylabel!("y")

# cos  kosinus (koszínusz):
y1 = cos.(t);
plot(t, y1, title="cos(t)", label="cos(t)", lw=4, color=:blue, xticks=0:10)
xlabel!("x")
ylabel!("y")

# tan  tangens (tangens):
t = 0:0.1:4*pi;
y3 = tan.(t);
plot(t, y3, label="tg(t)", lw=4, color=:blue,xticks=0:4*pi)

# ctg  kotangens (kotangens):
y4 = cot.(t);
plot(t, y4, label="ctg(t)", lw=4, color=:blue,xticks=0:4*pi)

# multiple signals on the same schedule  više signala na istom grafiku (több grafikon egy rajzon):
plot(t, y, title="sin(t) and cos(t)", label="sin(t)", xticks=0:10, lw=3, color=:blue)
plot!(t, y1, label="cos(t)", xticks=0:15, lw=3, color=:blue)
xlabel!("t")
ylabel!("y")

# triangle  trougaona (háromszög):
t = 0:0.1:2;
y = 5 * t .* (t .< 1) + (-5 * t .+ 10) .* ((t .>= 1) .& (t .<= 2));
plot(t, y, title="Triangle", lw=4, color=:blue)
xlabel!("t")
ylabel!("y")

x = [0, 1, 0.5, 0]
y = [0, 0, sqrt(3)/2, 0]
plot(x,y, title="Triangle", lw=3, color=:blue)

# periodic signals  periodičan signal (periódikus grafikon):
t = 0:0.1:8;
tp = rem.(t, 2);
y = 5 * tp .* (tp .< 1) + (-5 * tp .+ 10) .* ((tp .>= 1) .& (tp .<= 2));
plot(t, y, title="Periodic signals", lw=4, color=:blue)
xlabel!("t")
ylabel!("y")

# complex signals  složeni signali (összetett grafikonok):
# example 1:
t = 0:0.1:6;
ys = abs.(sin.(pi/3 * t));
y = min.(ys, 0.75);
scatter(t, ys, markershape=:o, markerstrokecolor=:green, color=:yellow)
plot!(t, y, lw=2, xlabel="t", ylabel="|sin|", color=:blue)

# example 2:
t = 0:0.1:6;
ys = abs.(sin.(pi/3 * t));
p = 1/6 * t;
y = min.(ys, p);
scatter(t, ys, markershape=:o, markerstrokecolor=:green, color=:yellow, label = "ys")
plot!(t, y, lw=2, xlabel="t", ylabel="|sin|", color=:blue, label = "y")

# example 3:
t = 0:0.1:6;
ys = abs.(sin.(pi/3 * t));
tp = rem.(t, 3);
p = 1/3 * tp;
y = min.(ys, p);
scatter(t, ys, markershape=:o, markerstrokecolor=:green, color=:yellow, label = "ys")
plot!(t, y, lw=2, xlabel="t", ylabel="|sin|", color=:blue, label = "y")

# example 4:
t = 0:0.1:15;
tp = rem.(t, 3)
y = (-1 / 3 * t .+ 5) .* (tp .< 2)
plot(t, y, lw=4, color=:blue, label = "y")

# multiple small charts in the same image  više malih grafikona na istoj slici (több grafikon kicsiben egy képen):
# example 1:
t = 0:0.1:4*pi;
y1 = sin.(t);
y2 = cos.(t);
y3 = tan.(t);
y4 = cot.(t);
p1 = plot(t, y1, label="sin(t)", xticks=0:4*pi, lw=3, color=:blue);
p2 = plot(t, y2, label="cos(t)", xticks=0:4*pi, lw=3, color=:red);
p3 = plot(t, y3, label="tg(t)", xticks=0:4*pi, lw=3, color=:red);
p4 = plot(t, y4, label="ctg(t)", xticks=0:4*pi, lw=3, color=:blue);
plot(p1, p2, p3, p4, layout=(4, 1))

# example 2:
plot(rand(100, 4), layout=4)

# example 3:
plot(rand(100, 4), layout=(4, 1))


# Testing in Julia  testiranje u Juliji (tesztelés):
using Test;

# linear search  linearna pretraga (lineáris keresés):
function linearSearch(A, key)  
    @inbounds for k = 1:length(A)
        if A[k] == key
            return k;
        end
    end
    return 0;
end

# unit tests  unit testovi (unit tesztek):
@test linearSearch([8,4,2,9,3,6], 3) == 5   # one test  jedan test (csak egy teszt):

# writing a test set  pisanje test seta (teszt set írása):
@testset "Linear Search Tests" begin
    X = [8,4,2,9,3,6];
    @test linearSearch(X, 8) == 1
    @test linearSearch(X, 6) == 6
    @test linearSearch(X, 5) == 0
    @test linearSearch([], 6) == 0
    @test linearSearch([6], 6) == 1
    @test linearSearch([6 6], 6) == 1
end;

# linear search all  linearna pretraži sve (lineáris keresés minden elem):
function linearSearchAll(A, key)
    rez = []
    for k in eachindex(A)
        if A[k] == key
            push!(rez, k);         
        end
    end 
    return rez;
end

# unit tests  unit testovi (unit tesztek):
@test linearSearchAll([2,4,2,3,3,2], 3) == [4, 5]   # one test  jedan test (csak egy teszt):

# writing a test set  pisanje test seta (teszt set írása):
@testset "Linear Search All Tests" begin
    X = [2,4,2,3,3,2];
    @test linearSearchAll(X, 8) == []
    @test linearSearchAll(X, 2) == [1, 3, 6]
    @test linearSearchAll(X, 3) == [4, 5]
    @test linearSearchAll(X, 4) == [2]
    @test linearSearchAll([], 6) == []
    @test linearSearchAll([6], 6) == [1]
    @test linearSearchAll([6 6], 6) == [1, 2]
end