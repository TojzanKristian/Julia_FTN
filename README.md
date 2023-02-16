# Julia
_Content of the repository_ :
  1. StartWithJulia.jl - the basics of Julia
  2. Search Algorithms :
      * LinearSearch.jl
      * BinarySearch.jl
      * main.jl - testing search algorithms
  3. Sorting Algorithms :
      * BubbleSort.jl
      * InsertionSort.jl
      * SelectionSort.jl
      * QuiskSort.jl
      * MergeSort.jl
      * HeapSort.jl
      * CountingSort.jl
      * RadixSort.jl
      * main.jl - testing sorting algorithms
  4. Algorithms for strings :
      * CaesarCipher.jl
      * LongestCommonSubsequence.jl
      * NumberOfWordsInTheSentence.jl
      * String Matching Algorithms :
        - BruteForce.jl
        - Knuth-Morris-Pratt.jl
        - Rabin-Karp.jl
      * main.jl - testing algorithms for strings
  5. Graphs :
      * Graph.jl - graph implementation and algorithms testing
      * BreadthFirstSearch.jl
      * DepthFirstSearch.jl
      * DirectedAcyclicGraph.jl
      * Dijkstra.jl
      * Bellman–Ford.jl
      * ComputingShortestDistances.jl
      * Floyd–Warshall.jl
      * BinarySearchTree.jl - binary search tree implementation and examples
      * Red-Black-Tree.jl - red-black tree implementation and examples
  6. Dynamic programming :
      * DynamicProgramming.jl
      * main.jl - testing functions before and after applying dynamic programming
  7. Machine Learning in Julia :
      * Linear regression :
        - Data - CSV files for testing
        - KFoldCrossValidation.jl
        - LinearRegression.jl
        - OneHotEncoder.jl
      * Logistic regression :
        - Data - CSV files for testing
        - LogisticRegression1.jl
        - LogisticRegression2.jl
      * Genetic algorithm :
        - example1 - implementing a genetic algorithm for a simple example
        - example2 - implementation of a genetic algorithm for the solution of a function
        - example3 - analysis of different cases of genetic algorithm
        - example4 - the knapsack problem solved by genetic algorithm
      * Particle Swarm Optimization :
        - example1 - implementing the particle swarm optimization for a simple example
        - example2 - implementation the particle swarm optimization for the solution of a function
      * Ant Colony Optimization :
        - example1 - implementing the ant colony optimization for a simple example
        - example2 - solving the traveling salesman problem using ant colony optimization 
  8. Data preparation :
      * Data - CSV files for testing
      * main.jl - example of a data preparation
      * main1.jl - another example of a data preparation
  9. Modeling and simulation of the system :
      * Translational mechanical systems
      * Rotational mechanical systems

## Getting started
1) Download and Install Julia : https://julialang.org/downloads
2) Download and Install VS Code : https://code.visualstudio.com/download
3) Open the Julia extension on the VS Code Marketplace and press Install; or manually install by doing the following steps:
    * Start VS Code.
    * Inside VS Code, go to the Extensions view by clicking View on the top menu bar and then selecting Extensions.
    * In the Extensions view, search for the term "julia" in the Marketplace search box, then select the Julia extension (julialang.language-julia) and select the Install button.
    * Restart VS Code.

## Installing packages in Julia
1) Open the Julia Command-Line
2) Type the following command, and then press ENTER:

_These packages are required for the file StartWithJulia.jl_
```
using Pkg;
Pkg.add("LinearAlgebra");
Pkg.add("Statistics");
Pkg.add("Polynomials");
Pkg.add("Plots");
Pkg.add("Test");
```

_These packages are required for the folder Machine Learning in Julia_
```
using Pkg;
Pkg.add("GLM");
Pkg.add("StatsModels");
Pkg.add("DataFrames");
Pkg.add("CSV");
Pkg.add("Lathe");
Pkg.add("Plots");
Pkg.add("MLBase");
Pkg.add("StatsBase");

# Copy this and run in the command prompt Julia
# ] add https://github.com/diegozea/ROC.jl
```

_These packages are required for the folder Ant Colony Optimization_
```
using Pkg;
Pkg.add("StatsBase");
```

_These packages are required for the folder Data preparation_
```
using Pkg;
Pkg.add("PlotlyJS");
Pkg.add("ORCA");
Pkg.add("Statistics");
Pkg.add("StatsModels");
Pkg.add("DataFrames");
Pkg.add("CSV");
Pkg.add("Plots");
Pkg.add("StatsBase");
Pkg.add("StatsPlots");  
```

_These packages are required for the folder Modeling and simulation of the system_
```
using Pkg;
Pkg.add("LinearAlgebra");
Pkg.add("DifferentialEquations");
Pkg.add("Plots");
```