# TESTING SEARCH ALGORITHMS

# testiranje algoritama pretrage
# keresési algoritmusok tesztelése

include("LinearSearch.jl");
include("BinarySearch.jl");

# EXAMPLES :
A = [10 10 8 7 7 7 5 4 3 2 2 1];
B = [10 8 7 5 4 3 2 1];

# example 1:    - linear search testing  testiranje linerane pretrage (lineáris keresés tesztelése):
println("Linear search testing:");
println("Array A : $A");
println("Index of 7 in array A : $(linearSearch(A, 7))");
println();
println("Array B : $B");
println("Index of 4 in array B : $(linearSearch(B, 4))");
println();println();


# example 2:    - linear search all testing  testiranje linerane pretrage svih (minden elem lineárisan keresésének tesztelése):
println("Linear search all testing:");
println("Array A : $A");
all7A = linearSearchAll(A, 7);
println("All indexes of 7 is array A : $all7A");
println();
all10A = linearSearchAll(A, 10);
println("All indexes of 10 in array A : $all10A");
println();
all2A = linearSearchAll(A, 2);
println("All indexes of 2 in array A : $all2A");
println();println();


# example 3:    - linear search with sentinel testing  testiranje linerane pretrage sa stražarem (lineáris keresés tesztelése őrrel):
println("Linear search with sentinel testing:");
println("Array A : $A");
println("Index of 6 is array A : $(linearSearchWithSentinel(A, 6))");
println();println();


# example 4:    - binary search testing  testiranje binarne pretrage (bináris keresés tesztelése):
println("Binary search testing:");
position = binarySearch(A, 3);

println("3 in array A is :");
if(position==-1)
   println("not in A!")
 elseif(position <= length(A)/2)
   println("in the first half of the array at the position: $position")
 else
   println("in the second half of the array at the position: $position")
end
println();

position1 = binarySearch(A, 8);

println("8 in array A is :");
if(position1==-1)
   println("not in A!")
 elseif(position1 <= length(A)/2)
   println("in the first half of the array at the position: $position1")
 else
   println("in the second half of the array at the position: $position1")
end
println();println();


# example 5:    - binary search recursive testing  testiranje rekurzivne binarne pretrage (rekurzív bináris keresés tesztelése):
println("Binary search recursive testing:");
position = binarySearch(B, 7);

println("7 in array A is :");
if(position==-1)
   println("not in A!")
 elseif(position <= length(A)/2)
   println("in the first half of the array at the position: $position")
 else
   println("in the second half of the array at the position: $position")
end
println();

position1 = binarySearch(B, 2);

println("2 in array A is :");
if(position1==-1)
   println("not in A!")
 elseif(position1 <= length(A)/2)
   println("in the first half of the array at the position: $position1")
 else
   println("in the second half of the array at the position: $position1")
end
println();println();