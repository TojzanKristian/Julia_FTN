# BINARY SEARCH TREE

# Binarno stablo pretrage
# Bináris keresési fa

# structure for node BSP  struktura za čvor BSP (struktúra ami a bináris keresési fa csomóját imitálja):
mutable struct BSPNode
    key :: Int64
    parent :: Union{Nothing, BSPNode}
    leftSubTree :: Union{Nothing, BSPNode}
    rightSubTree :: Union{Nothing, BSPNode}
end

# node initialization  inicijalizacija čvora (csomó inicijalizálása):
BSPNode(k::Int64) = BSPNode(k, nothing, nothing, nothing);
BSPNode(k::Int64, rNode::BSPNode) = BSPNode(k, rNode, nothing, nothing);

# structure for BSP  struktura za BSP (struktúra ami bináris keresési fát imitálja):
mutable struct BSP
    root :: Union{Nothing, BSPNode}
end

# BPS initialization  inicijalizacija BSP (bináris keresési fa inicializálása):
BSP() = BSP(nothing);

# a function that prints BSP nodes  funkcija koja ispisuje čvorove BSPa (függvény, amely kiírja a bináris keresési fa csomóit):
printBSP(a::BSPNode) = begin
    if a.leftSubTree != nothing 
        printBSP(a.leftSubTree)
    end
    print(" ", a.key)
    if a.rightSubTree != nothing
        printBSP(a.rightSubTree)
    end
end

# function that adds a node to the BSP  funkcija koja dodaje čvor u BSP (függvény, amely csomópontot ad hozzá a bináris keresési fához):
function addNode!(t::BSP, z::BSPNode)
    y = nothing;
    x = t.root;
    while x != nothing
        y = x;
        x = (z.key < x.key) ? x.leftSubTree : x.rightSubTree;
    end

    z.parent = y; 
    if y == nothing
        t.root = z;
    elseif z.key < y.key
        y.leftSubTree = z;
    else
        y.rightSubTree = z;
    end
end

# a function that finds a node in BSP  funkcija koja pronalazi čvor u BSPu (függvény, amely megtalálja a csomót a bináris keresési fában):
function find(node::Union{Nothing, BSPNode}, k)
    while node != nothing && node.key != k
        if k < node.key
            node = node.leftSubTree;
        else
            node = node.rightSubTree;
        end
    end
    return node;
end

# function that finds the minimum in the BSP  funkcija koja pronalazi minimum u BSPu (függvény, amely megtalálja a legkisseb értéket a bináris keresési fában):
function minimum(node::BSPNode)
    while node.leftSubTree != nothing
        node = node.leftSubTree;
    end
    return node;
end

# function that finds the maximum in the BSP  funkcija koja pronalazi maksimum u BSPu (függvény, amely megtalálja a legnagyobb értéket a bináris keresési fában):
function maximum(node::BSPNode)
    while node.rightSubTree != nothing
        node = node.rightSubTree;
    end
    return node;
end

# function that finds the next node in BSP  funkcija koja pronalazi sledeći čvor u BSPu (függvény, amely megtalálja a következő csomót a bináris keresési fában):
function next(t::BSPNode)
    if t.rightSubTree != nothing
        return minimum(t.rightSubTree);
    else
        node = t.parent;
        while node != nothing && t == node.rightSubTree
            t = node;
            node = node.prenet;
        end
        return node;
    end
end

# function that finds the previous node in BSP  funkcija koja pronalazi prethodni čvor u BSPu (függvény, amely megtalálja az előző csomót a bináris keresési fában):
function previous(t::BSPNode)
    if t.leftSubTree != nothing
        return maximum(t.leftSubTree)
    else
        node = t.parent;
        while node != nothing && t == node.leftSubTree
            t = node;
            node = node.parent;
        end
        return node;
    end
end

# a function that replaces a node in BSP  funkcija koja zamenjuje čvor u BSPu (függvény, amely megváltoztatja a csomót a bináris keresési fában):
function replace!(t::BSP, x::BSPNode, y::Union{Nothing, BSPNode})
    if x.parent == nothing
        t.root = y;
    elseif x == x.parent.leftSubTree
        x.parent.leftSubTree = y;
    else
        x.parent.rightSubTree = y;
    end
    if y != nothing     
        y.parent = x.parent;
    end
end

# a function that delete a node in BSP  funkcija koja briše čvor iz BSPa (függvény, amely kitörli a csomót a bináris keresési fából):
function clear!(t::BSP, z::BSPNode)
    if z.leftSubTree == nothing
        replace!(t, z, z.rightSubTree);
    elseif z.rightSubTree == nothing
        replace!(t, z, z.leftSubTree);
    else
        y = minimum(z.rightSubTree);
        if y.parent != z
            replace!(t, y, y.rightSubTree);
            y.rightSubTree = z.rightSubTree;
            y.rightSubTree.parent = y;
        end
        replace!(t, z, y);
        y.leftSubTree = z.leftSubTree;
        y.leftSubTree.parent = y;
    end 
end

# draw BSP  nacrtaj BSP (bináris keresési fa kirajzolása):
using Plots

function draw(t::BSP; circle=10, showKey=false)
    x = 0;
    dx = 1;
    y = 100;
    dy = 1;
    XNode = [];
    YNode = [];
    S = [];
    Xv = []; 
    Yv = [];

    function drawNode(t::BSPNode, x, y, dx)
        push!(XNode, x)
        push!(YNode, y)
        push!(S, string(t.key))
        if t.leftSubTree != nothing
            drawNode(t.leftSubTree, x-dx, y-dy, dx/2)
            append!(Xv, [x, x-dx, NaN])
            append!(Yv, [y, y-dy, NaN])
        end
        if t.rightSubTree != nothing
            drawNode(t.rightSubTree, x+dx, y-dy, dx/2)
            append!(Xv, [x, x+dx, NaN])
            append!(Yv, [y, y-dy, NaN])
        end
    end
    
    drawNode(t.root, x, y, dx);
    plot(Xv, Yv, labels="", showaxis=false, grid=false, size=(1000,300));
    plot!(XNode, YNode, markersize=circle, markershape=:circle, markercolor=:blue, lw=0, labels="");

    if !showKey
        S = [];
    end

    plot!(XNode, YNode .- dy/2, lw=0, labels="", series_annotations = S)   
end

# EXAMPLES

# example 1:    - drow BSP  nacrtaj BSP (rajzold le a bináris keresési fát):
t = BSP();
for node in [12, 18, 5, 9, 2, 15, 17, 19, 13]
    addNode!(t, BSPNode(node))
end

draw(t, circle=15, showKey=true)


# example 2:    - drow BSP  nacrtaj BSP (rajzold le a bináris keresési fát):
t = BSP();
for k in rand(Int,100)
    addNode!(t, BSPNode(k));
end

draw(t, circle=5);


# example 3:    - print BSP  ispiši BSP (ird ki a bináris keresési fát):
t = BSP();
for node in [12, 18, 5, 9, 2, 15, 17, 19, 13]
    addNode!(t, BSPNode(node))
end

printBSP(t.root);
println();


# example 4:    - found node in BSP  pronađi čvor u BSPu (találd meg a csomót a bináris keresési fában):
println("Found node : $(find(t.root,15).key)");
println("Found node : $(find(t.root,10))");


# example 5:    - minimum in BSP  minimum u BSPu (a legkissebb érték a bináris keresési fában):
println("Minimum in BSP is : $(minimum(t.root).key)");


# example 6:    - maximum in BSP  maksimum u BSPu (a legnagyobb érték a bináris keresési fában):
println("Maximum in BSP is : $(maximum(t.root).key)");


# example 7:    - next node in BSP  sledeći čvor u BSPu (a következő csomó a bináris keresési fában):
println("Next node for root in BSP is : $(next(t.root).key)");
println("Next node for 2 in BSP is : $(next((minimum(t.root))).key)");


# example 8:    - previous node in BSP  prethodni čvor u BSPu (az előző csomó a bináris keresési fában):
println("Previous node for 15 in BSP is : $(previous(find(t.root,15)).key)");
println("Previous node for 13 in BSP is : $(previous(previous(previous(find(t.root,15)))).key)");


# example 9:    - replace node in BSP  zameni čvor u BSPu (csomó megváltoztatása a bináris keresési fában):
clear!(t, find(t.root,19));
printBSP(t.root);
println();
draw(t, circle=15, showKey=true)


# example 10:    - delete node in BSP  obriši čvor iz BSPa (csomó törlése a bináris keresési fából):
clear!(t, find(t.root,12));
printBSP(t.root);
println();
draw(t, circle=15, showKey=true)