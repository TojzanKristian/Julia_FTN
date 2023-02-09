# TESTING SORTING ALGORITHMS

# testiranje algoritama za sortiranje
# sorrendbe állítási algoritmusok tesztelése

include("BubbleSort.jl");
include("InsertionSort.jl");
include("SelectionSort.jl");
include("QuickSort.jl");
include("MergeSort.jl");
include("HeapSort.jl");

# EXAMPLES :

# example 1:    - Bubble Sort testing  testiranje Bubble Sorta (Bubble Sort tesztelése):
A = [5 20 7 33 2 50 4 28 6 39 1 47 3 10 22 42 8 44 23 11 41 13 25 19 32 9];
println("Bubble Sort testing:");
println("Before sort:");
println(A);
bubblesort!(A);
println("Afer sort:");
println(A);
println("The execution time of Bubble Sort is: $(@elapsed bubblesort!(A))");
println();println();


# example 2:    - Selection Sort testing  testiranje Selection Sorta (Selection Sort tesztelése):
B = [5 20 7 33 2 50 4 28 6 39 1 47 3 10 22 42 8 44 23 11 41 13 25 19 32 9];
println("Selection Sort testing:");
println("Before sort:");
println(B);
selectionSort!(B);
println("Afer sort:");
println(B);
println("The execution time of Selection Sort is: $(@elapsed selectionSort!(B))");
println();println();


# example 3:    - Insertion Sort testing  testiranje Insertion Sorta (Insertion Sort tesztelése):
C = [5 20 7 33 2 50 4 28 6 39 1 47 3 10 22 42 8 44 23 11 41 13 25 19 32 9];
println("Insertion Sort testing:");
println("Before sort:");
println(C);
insertionSort!(C);
println("Afer sort:");
println(C);
println("The execution time of Insertion Sort is: $(@elapsed insertionSort!(C))");
println();println();


# example 4:    - Quick Sort testing  testiranje Quick Sorta (Quick Sort tesztelése):
D = [5 20 7 33 2 50 4 28 6 39 1 47 3 10 22 42 8 44 23 11 41 13 25 19 32 9];
println("Quick Sort testing:");
println("Before sort:");
println(D);
quickSort!(D);
println("Afer sort:");
println(D);
println("The execution time of Quick Sort is: $(@elapsed quickSort!(D))");
println();println();


# example 5:    - Merge Sort testing  testiranje Merge Sorta (Merge Sort tesztelése):
E = [5 20 7 33 2 50 4 28 6 39 1 47 3 10 22 42 8 44 23 11 41 13 25 19 32 9];
println("Merge Sort testing:");
println("Before sort:");
println(E);
mergeSort1!(E);
println("Afer sort:");
println(E);
println("The execution time of Merge Sort1 is: $(@elapsed mergeSort1!(E))");
println();

F = [5 20 7 33 2 50 4 28 6 39 1 47 3 10 22 42 8 44 23 11 41 13 25 19 32 9];
println("Before sort:");
println(F);
mergeSort2!(F);
println("Afer sort:");
println(F);
println("The execution time of Merge Sort2 is: $(@elapsed mergeSort2!(F)))");
println();println();


# example 6:    - Heap Sort testing  testiranje Heap Sorta (Heap Sort tesztelése):
G = [5 20 7 33 2 50 4 28 6 39 1 47 3 10 22 42 8 44 23 11 41 13 25 19 32 9];
println("Heap Sort testing:");
println("Before sort:");
println(G);
heapSort!(G);
println("Afer sort:");
println(G);
println("The execution time of Heap Sort is: $(@elapsed heapSort!(G))");
println();println();