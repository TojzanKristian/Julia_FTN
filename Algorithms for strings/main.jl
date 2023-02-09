# TESTING ALGORITHMS FOR STRINGS

# testiranje algoritama za stringove
# szövegekkel variáló algoritmusok tesztelése

include("CaesarCipher.jl");
include("LongestCommonSubsequence.jl");
include("NumberOfWordsInTheSentence.jl");
include("String Matching Algorithms/BruteForce.jl");
include("String Matching Algorithms/Rabin-Karp.jl");
include("String Matching Algorithms/Knuth-Morris-Pratt.jl");

# EXAMPLES :

# example 1:    - encryption with Caesar's cipher  šifrovanje cezarovom šifrom (titkosítás Cézár módszerével):
println("Caesar cipher testing:");
encrypted = caesarCipher("A little bit of text", 3);
println("Text before Caesar cipher : A little bit of text, text after Caesar cipher: $encrypted");

text = caesarCipher(encrypted, -3);
println("Text before Caesar cipher : $encrypted, text after Caesar cipher: $text");
println();println();


# example 2:    - counting words in a sentence  prebrojavanje slova u rečenici (betűk megszámolása a mondatban):
println("Counting words testing:");
text = "tralalalalala";
n = numberOfWords(text, 'a');
println("Number of 'a' in text : $text is $n.");

text = "Just a sentence.";
n = numberOfWords(text, 'z');
println("Number of 'z' in text : $text is $n.");

text = "Just a sentence.";
n = numberOfWords(text, 'e');
print("Number of 'e' in text : $text is $n.\n\n");


# example 3:    - longest common subsequence  najduža zajednička podsekvenca (leghosszabb közös résztartomány a szövegben):
println("Longest common subsequence testing:");
x = "ABCBDAB";
y = "BDCABA";
L, b = LCS(x, y);
LCSPrint(b, x, length(x), length(y));
println();

s1 = "GTAACAGTAAACG";
s2 = "AAC";
L, b = LCS(s1, s2);
LCSPrint(b, s1, length(s1), length(s2));
println();println();


# example 4:    - string matching testing  testiranje podudaranja stringova (karakterláncok egyezésének tesztelése):
println("String matching testing:");
s1 = "GTAACAGTAAACG";
s2 = "AAC";

println("Brute force algorthm:");
n = bruteForce(s1, s2);
println("The positions where found $s2 in $s1 : $n");
println("The execution time of Brute force is: $(@elapsed bruteForce(s1, s2))");
println();

println("Knuth-Morris-Pratt algorthm:");
n = KMP(s1, s2);
println("The positions where found $s2 in $s1 : $n");
println("The execution time of Knuth-Morris-Pratt algorthm is: $(@elapsed KMP(s1, s2))");
println();

println("Rabin-Karp algorthm:");
n = rabinKarp(s1, s2);
println("The positions where found $s2 in $s1 : $n");
println("The execution time of Rabin-Karp algorthm is: $(@elapsed rabinKarp(s1, s2))");
println();println();


# example 5:    - string matching testing  testiranje podudaranja stringova (karakterláncok egyezésének tesztelése):
T = "abababaeababacad";
P = "ababaca";

println("Brute force algorthm:");
n = bruteForce(T, P);
println("The positions where found $P in $T : $n");
println("The execution time of Brute force is: $(@elapsed bruteForce(T, P))");
println();

println("Knuth-Morris-Pratt algorthm:");
n = KMP(T, P);
println("The positions where found $P in $T : $n");
println("The execution time of Knuth-Morris-Pratt algorthm is: $(@elapsed KMP(T, P))");
println();

println("Rabin-Karp algorthm:");
n = rabinKarp(T, P);
println("The positions where found $P in $T : $n");
println("The execution time of Rabin-Karp algorthm is: $(@elapsed rabinKarp(T, P))");
println();println();