# DYNAMIC PROGRAMMING TESTING

include("DynamicProgramming.jl");

# Tessing the application of the function for calculating fibonacci :
# tesiranje primene funkcije za računanje fibonačija :
# a fibonacci kiszámításához szükséges függvény tesztelése :
println("Testing function fibonacci() :");
println("fibonacci(5) : ", fibonacci(5));
println("The execution time of fibonacci(5) is: $(@elapsed fibonacci(5))");
println("fibonacci(8) : ", fibonacci(8));
println("The execution time of fibonacci(8) is: $(@elapsed fibonacci(8))");
println("fibonacci(10) : ", fibonacci(10));
println("The execution time of fibonacci(10) is: $(@elapsed fibonacci(10))");
println("fibonacci(15) : ", fibonacci(15));
println("The execution time of fibonacci(15) is: $(@elapsed fibonacci(15))");
println("fibonacci(25) : ", fibonacci(25));
println("The execution time of fibonacci(25) is: $(@elapsed fibonacci(25))");
println("fibonacci(50) : ", fibonacci(50));
println("The execution time of fibonacci(50) is: $(@elapsed fibonacci(50))");
println("fibonacci(52) : ", fibonacci(52));
println("The execution time of fibonacci(52) is: $(@elapsed fibonacci(52))");
println();

println("Testing function fibFromUpToDown() :");
println("fibonacci(5) : ", fibFromUpToDown(5));
println("The execution time of fibFromUpToDown(5) is: $(@elapsed fibFromUpToDown(5))");
println("fibonacci(8) : ", fibFromUpToDown(8));
println("The execution time of fibFromUpToDown(8) is: $(@elapsed fibFromUpToDown(8))");
println("fibonacci(10) : ", fibFromUpToDown(10));
println("The execution time of fibFromUpToDown(10) is: $(@elapsed fibFromUpToDown(10))");
println("fibonacci(15) : ", fibFromUpToDown(15));
println("The execution time of fibFromUpToDown(15) is: $(@elapsed fibFromUpToDown(15))");
println("fibonacci(25) : ", fibFromUpToDown(25));
println("The execution time of fibFromUpToDown(25) is: $(@elapsed fibFromUpToDown(25))");
println("fibonacci(50) : ", fibFromUpToDown(50));
println("The execution time of fibFromUpToDown(50) is: $(@elapsed fibFromUpToDown(50))");
println("fibonacci(52) : ", fibFromUpToDown(52));
println("The execution time of fibFromUpToDown(52) is: $(@elapsed fibFromUpToDown(52))");
println();

println("Testing function fibFromDownToUp() :");
println("fibonacci(5) : ", fibFromDownToUp(5));
println("The execution time of fibFromDownToUp(5) is: $(@elapsed fibFromDownToUp(5))");
println("fibonacci(8) : ", fibFromDownToUp(8));
println("The execution time of fibFromDownToUp(8) is: $(@elapsed fibFromDownToUp(8))");
println("fibonacci(10) : ", fibFromDownToUp(10));
println("The execution time of fibFromDownToUp(10) is: $(@elapsed fibFromDownToUp(10))");
println("fibonacci(15) : ", fibFromDownToUp(15));
println("The execution time of fibFromDownToUp(15) is: $(@elapsed fibFromDownToUp(15))");
println("fibonacci(25) : ", fibFromDownToUp(25));
println("The execution time of fibFromDownToUp(25) is: $(@elapsed fibFromDownToUp(25))");
println("fibonacci(50) : ", fibFromDownToUp(50));
println("The execution time of fibFromDownToUp(50) is: $(@elapsed fibFromDownToUp(50))");
println("fibonacci(52) : ", fibFromDownToUp(52));
println("The execution time of fibFromDownToUp(52) is: $(@elapsed fibFromDownToUp(52))");
println();println();


# Tessing the application of the function for cutting piples :
# tesiranje primene funkcije za sečenje cevi :
# a csővágást szimuláló függvény tesztelése :
# example 1:
prices = [1, 5, 8, 9, 10, 17, 17, 20, 24, 30];
println("Testing function cuttingPipes() :");
println(cuttingPipes(prices, 9));
println("The execution time of cuttingPipes(prices, 9) is: $(@elapsed cuttingPipes(prices, 9))");
println();

println("Testing function cuttingPipesFromUpToDown() :");
println(cuttingPipesFromUpToDown(prices, 9));
println("The execution time of cuttingPipesFromUpToDown(prices, 9) is: $(@elapsed cuttingPipesFromUpToDown(prices, 9))");
println();

println("Testing function cuttingPipesFromDownToUp() :");
printCuts(prices, 9);
println("The execution time of cuttingPipesFromDownToUp(prices, 9) is: $(@elapsed cuttingPipesFromDownToUp(prices, 9))");
println();println();

# example 2:
prices = [1, 3, 5, 9, 13, 23, 39, 59, 91];
println("Testing function cuttingPipes() :");
println(cuttingPipes(prices, 5));
println("The execution time of cuttingPipes(prices, 5) is: $(@elapsed cuttingPipes(prices, 5))");
println();

println("Testing function cuttingPipesFromUpToDown() :");
println(cuttingPipesFromUpToDown(prices, 5));
println("The execution time of cuttingPipesFromUpToDown(prices, 5) is: $(@elapsed cuttingPipesFromUpToDown(prices, 5))");
println();

println("Testing function cuttingPipesFromDownToUp() :");
printCuts(prices, 5);
println("The execution time of cuttingPipesFromDownToUp(prices, 5) is: $(@elapsed cuttingPipesFromDownToUp(prices, 5))");
println();println();