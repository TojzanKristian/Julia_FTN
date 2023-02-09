# RED BLACK TREE

# Crveno-Crno stablo 
# Vörös-Fekete fa

# node display colors  boje za prikaz čvorova (szinek a csomók szinezéséhez):
const RED = 1;  # crvena (piros/vörös)
const BLACK = 2;    # crna (fekete)

# structure for node RBTNode  struktura za čvor crveno-crnog stabla (struktúra ami a vörös-fekete fa csomóját imitálja):
mutable struct RBTNode
    key :: Int64
    color :: Int8
    parent :: RBTNode
    leftSubTree :: RBTNode
    rightSubTree :: RBTNode 
    RBTNode() = (x = new(); x.key = 0; x.parent = x; x.leftSubTree = x; x.rightSubTree = x; x.color = BLACK; return x)
end

# node initialization  inicijalizacija čvora (csomó inicijalizálása):
RBTNode(k::Int64) = (x = RBTNode(); x.key = k; return x);

# structure for RBT  struktura za crveno-crno stablo (struktúra ami vörös-fekete fát imitálja):
mutable struct RBTree
    root :: RBTNode
    nil :: RBTNode
    RBTree() = (x = new(); x.nil = RBTNode(); x.root = x.nil; return x)     # initialization of RBTree  inicijalizacija CCStabla (a vörös-fekete fa inicijalizálása)
end

# red-black tree printing function  funkcija za ispis crveno-crnog stabla (függvény, amely kiírja a vörös-fekete fát):
function printRBTree(t::RBTree)
    function printRBTNode(a::RBTNode)
        if a.leftSubTree != t.nil 
            printRBTNode(a.leftSubTree);
        end
        print(" ", a.key);
        if a.rightSubTree != t.nil
            printRBTNode(a.rightSubTree);
        end
    end
    printRBTNode(t.root);
end

# rotates a given node to the left  rotira zadati čvor u levo (a megadott csomó balra forgatása a fán belül):
function rotateLeft!(t::RBTree, x::RBTNode)
    y = x.rightSubTree;
    x.rightSubTree = y.leftSubTree;
    if y.leftSubTree != t.nil
        y.leftSubTree.parent = x;
    end
    y.parent = x.parent;
    if x.parent == t.nil
        t.root = y;
    elseif x == x.parent.leftSubTree
        x.parent.leftSubTree = y;
    else
        x.parent.rightSubTree = y;
    end
    y.leftSubTree = x;
    x.parent = y;
end

# rotates a given node to the right  rotira zadati čvor u desno (a megadott csomó jobbra forgatása a fán belül):
function rotateRight!(t::RBTree, x::RBTNode)
    y = x.leftSubTree;
    x.leftSubTree = y.rightSubTree;
    if y.rightSubTree != t.nil
        y.rightSubTree.parent = x;
    end
    y.parent = x.parent;
    if x.parent == t.nil
        t.root = y;
    elseif x == x.parent.leftSubTree
        x.parent.leftSubTree = y;
    else
        x.parent.rightSubTree = y;
    end
    y.rightSubTree = x;
    x.parent = y;
end

# correction after adding a node  korigovanje posle dodavanja čvora (a csomó hozzáadása utáni helyreállítás):
function correctadd!(t, z)
    while z.parent.color == RED
        if z.parent == z.parent.parent.leftSubTree
            y = z.parent.parent.rightSubTree;
            if y.color == RED
                z.parent.color = BLACK;
                y.color = BLACK;
                z.parent.parent.color = RED;
                z = z.parent.parent;
            else
                if z == z.parent.rightSubTree
                    z = z.parent
                    rotateLeft!(t, z);
                end
                z.parent.color = BLACK;
                z.parent.parent.color = RED;
                rotateRight!(t, z.parent.parent);
            end
        else
            y = z.parent.parent.leftSubTree;
            if y.color == RED
                z.parent.color = BLACK;
                y.color = BLACK;
                z.parent.parent.color = RED;
                z = z.parent.parent;
            else
                if z == z.parent.leftSubTree;
                    z = z.parent;
                    rotateRight!(t, z);
                end
                z.parent.color = BLACK;
                z.parent.parent.color = RED;
                rotateLeft!(t, z.parent.parent);
            end
        end
    end
    t.root.color = BLACK;
end

# add a node to rad-black tree  dodavanje čvora u crveno-crno stablo (csomó hozzáadása a vörös-fekete fához):
function add!(t::RBTree, z::RBTNode)
    y = t.nil;
    x = t.root;
    while x != t.nil
        y = x;
        x = (z.key < x.key) ? x.leftSubTree : x.rightSubTree;
    end
    z.parent = y;
    if y == t.nil
        t.root = z;
    elseif z.key < y.key
        y.leftSubTree = z;
    else
        y.rightSubTree = z;
    end
    z.leftSubTree = t.nil;
    z.rightSubTree = t.nil;
    z.color = RED;
    correctadd!(t, z);
    return z;
end

# replace a node in rad-black tree  izmena čvora u crveno-crnom stablu (csomó megváltoztatása a vörös-fekete fában):
function replace!(t::RBTree, x::RBTNode, y::RBTNode)
    if x.parent == t.nil
        t.root = y;
    elseif x == x.parent.leftSubTree
        x.parent.leftSubTree = y;
    else
        x.parent.rightSubTree = y;
    end 
    y.parent = x.parent;
end

# correction after deleting a node  korigovanje posle brisanja čvora (csomó törlése utáni helyreállítás):
function correctDelete!(t::RBTree, x::RBTNode)
    while x != t.root && x.color == BLACK
        if x == x.parent.leftSubTree
            w = x.parent.rightSubTree;
            if w.color == RED
                w.color = BLACK;
                x.parent.color = RED;
                rotateLeft!(t, x.parent);
                w = x.parent.rightSubTree;
            end
            if w.leftSubTree.color == BLACK && w.rightSubTree.color == BLACK
                w.color = RED;
                x = x.parent;
            else 
                if w.rightSubTree.color == BLACK
                    w.leftSubTree.color = BLACK;
                    w.color = RED;
                    rotateRight!(t, w);
                    w = x.parent.rightSubTree;
                end
                w.color = x.parent.color;
                x.parent.color = BLACK;
                w.rightSubTree.color = BLACK;
                rotateLeft!(t, x.parent);
                x = t.root;
            end
        else
            w = x.parent.leftSubTree;
            if w.color == RED
                w.color = BLACK;
                x.parent.color = RED;
                rotateRight!(t, x.parent);
                w = x.parent.leftSubTree;
            end
            if w.levo.color == BLACK && w.desno.boja == BLACK
                w.color = RED;
                x = x.parent;
            else 
                if w.leftSubTree.color == BLACK
                    w.rightSubTree.color = BLACK;
                    w.color = RED;
                    rotateLeft!(t, w);
                    w = x.parent.leftSubTree;
                end
                w.color = x.parent.color;
                x.parent.color = BLACK;
                w.leftSubTree.color = BLACK;
                rotateRight!(t, x.parent);
                x = t.root;
            end
        end
    end
    x.color = BLACK;
end

# delete a node from red-black tree  brisanje čvora iz crveno-crnog stabla (csomó törlése a vörös-fekete fából):
function clear!(t::RBTree, z::RBTNode)
    if z == t.nil
        return;
    end
    y = z;
    colory = y.color;
    if z.leftSubTree == t.nil
        x = z.rightSubTree;
        replace!(t, z, z.rightSubTree);
    elseif z.rightSubTree == t.nil
        x = z.leftSubTree;
        replace!(t, z, z.leftSubTree);
    else
        y = minimum(t, z.rightSubTree)
        colory = y.color;
        x = y.rightSubTree;
        if y.parent == z
            x.parent = y;
        else 
            replace!(t, y, y.rightSubTree);
            y.rightSubTree = z.rightSubTree;
            y.rightSubTree.r = y;
        end
        replace!(t, z, y)
        y.leftSubTree = z.leftSubTree;
        y.leftSubTree.r = y;
        y.color = z.color;
    end 
    if colory == BLACK
        correctDelete!(t, x);
    end
end

# find a node in red-black tree  pronalaženje čvora u crveno-crnom stablu (csomó keresése a vörös-fekete fában):
function find(t::RBTree, node::RBTNode, k)
    while node != t.nil && node.key != k
        if k < node.key
            node = node.leftSubTree;
        else
            node = node.rightSubTree;
        end
    end
    return node;
end

# the minimum of a subtree  minimum podstabla (minimum/legkisseb érték a részfában):
function minimum(t::RBTree, node::RBTNode)
    while node.leftSubTree != t.nil
        node = node.leftSubTree;
    end
    return node;
end

# the maximum of a subtree  maksimum podstabla (maksimum/legnagyobb érték  a részfában):
function maximum(t::RBTree, node::RBTNode)
    while node.rightSubTree != t.nil
        node = node.rightSubTree;
    end
    return node;
end

# next node  sledeći čvor (a következő csomó):
function next(t::RBTree, y::RBTNode)
    if y.rightSubTree != t.nil
        return minimum(t, y.rightSubTree);
    else
        node = y.parent;
        while node != t.nil && y == node.rightSubTree
            y = node;
            node = node.parent;
        end
        return node;
    end
end

# previous node  prethodni čvor (az előző csomó):
function previous(t::RBTree, y::RBTNode)
    if y.leftSubTree != t.nil
        return maximum(t, y.leftSubTree);
    else
        node = y.parent;
        while node != t.nil && y == node.leftSubTree
            y = node;
            node = node.parent;
        end
        return node;
    end
end

# draw a red-black tree  nacrtaj crveno-crno stablo (rajzold le a vörös-fekete fát):
using Plots

function drow(t::RBTree; circle=10, showKey=true, text)
    x = 0;
    dx = 1;
    y = 100;
    dy = 1;
    XRed = [];
    YRed = [];
    SRed = [];
    XBlack = [];
    YBlack = [];
    SBlack = [];
    Xv = [];
    Yv = [];

    # drow node  nacrtaj čvor (csomó kirajzolása):
    function drawNode(node::RBTNode, x, y, dx)
        if node.color == BLACK;
            push!(XBlack, x);
            push!(YBlack, y);
            push!(SBlack, string(node.key));
        else
            push!(XRed, x);
            push!(YRed, y);
            push!(SRed, string(node.key));
        end
        
        if node.leftSubTree != t.nil
            drawNode(node.leftSubTree, x-dx, y-dy, dx/2);
            append!(Xv, [x, x-dx, NaN]);
            append!(Yv, [y, y-dy, NaN]);
        end
        if node.rightSubTree != t.nil
            drawNode(node.rightSubTree, x+dx, y-dy, dx/2);
            append!(Xv, [x, x+dx, NaN]);
            append!(Yv, [y, y-dy, NaN]);
        end
    end
    
    drawNode(t.root, x, y, dx);
    plot(Xv, Yv, labels="", showaxis=false, grid=false, size=(1000,300), title=text);
    plot!(XBlack, YBlack, markersize=circle, markershape=:circle, markercolor=:black, lw=0, labels="");
    plot!(XRed, YRed, markersize=circle, markershape=:circle, markercolor=:red, lw=0, labels="");

    if !showKey
        SRed = [];
        SBlack = [];
    end

    plot!(XBlack, YBlack .- dy/2, lw=0, labels="", series_annotations = SBlack);
    plot!(XRed, YRed .- dy/2, lw=0, labels="", series_annotations = SRed);
end

# EXAMPLES :

# example 1:    - just drawing a given tree  samo crtanje datog stabla (az adott fa kirajzolása):
t = RBTree();
for k in [12, 18, 5, 9, 2, 15, 17, 19, 13]
    add!(t, RBTNode(k))
end

drow(t, showKey=true, text="Example 1")

# example 2:    - just drawing a given tree  samo crtanje datog stabla (az adott fa kirajzolása):
t = RBTree();    
for k in [11, 2, 14, 1, 7, 15, 5, 8]
    add!(t, RBTNode(k))
end

drow(t, text="Example 2")

# example 3:    - just drawing a random tree  crtanje stabla sa random generisanim brojevima čvorova (véletlenszerű számokkal generát fa kirajzolása):
using Random;
Random.seed!(1); 
t = RBTree();
for k in shuffle(1:50)
    add!(t, RBTNode(2*k))
end

drow(t, circle=5, showKey=false, text="Example 3 - Red-Black Tree with Random numbers")

# example 4:    - just print a given tree  samo ispiši dato stablo (az adott fa kiírása):
t = RBTree();
for k in [12, 18, 5, 9, 2, 15, 17, 19, 13]
    add!(t, RBTNode(k))
end

printRBTree(t);println();

# example 5:    - find node in red-black tree  pronalaženje čvora u CCStablu (csomó megtalálása a vörös-fekete fában):
t = RBTree();    
for k in [11, 2, 14, 1, 7, 15, 5, 8]
    add!(t, RBTNode(k))
end

println("\nFind node with key 15 in Red-Black Tree : $(find(t, t.root, 15).key)");
println("Find node with key 9 in Red-Black Tree : $(find(t, t.root, 9).key)");
println();

# example 6:    - minimum and maximum in red-black tree  minimum i maksimum u CCStablu (legkisseb és legnagyobb elem a vörös-fekete fában):
println("Maximum in Red-Black Tree : $(maximum(t, t.root).key)");
println("Minimum in Red-Black Tree : $(minimum(t, t.root).key)");
println();

# example 7:    - the next and previous node in red-black tree  sledeći i prethodni čvor u CCStablu (az előző és a következő elem a vörös-fekete fában):
println("Next node for 11 in Red-Black Tree : $(next(t, find(t, t.root, 11)).key)");
println("Previous node for 15 in Red-Black Tree : $(previous(t, previous(t, previous(t, find(t, t.root,15)))).key)");
println();

# example 8:    -  delete node from red-black tree  brisanje čvora iz CCStabla (csomó törlése a vörös-fekete fából):
clear!(t, find(t, t.root, 5));
drow(t, circle=15, showKey=true, text="Example 8 - Delete node from Red-Black Tree")

# example 9:    - red-black tree built from sorted keys  CCStablo izgrađeno od sortiranih ključeva (vörös-fekete fa, mely csomói rendezett elemekből állnak):
t = RBTree();
for k in 1:100
    add!(t, RBTNode(k))
end

println("Red-Black Tree with sorted keys:");
printRBTree(t);println();println();
drow(t, circle=5, showKey=false, text="Example 9 - Red-Black Tree with sorted keys")

# example 10:    - red-black tree with equal keys  CCStablo sa jednakim ključevimma (vörös-fekete fa, mely csomói egyenlő kulcsokat tartalmaznak):
t = RBTree();    
for k in [5, 2, 14, 2, 2, 2, 5, 5, 5]
    add!(t, RBTNode(k))
end

println("Red-Black Tree with equal keys:");
printRBTree(t);println();println();
drow(t, circle=5, showKey=false, text="Example 10 - Red-Black Tree with equal keys")

# example 11:   - passing through each node and printing the key  prolaz kroz svaki čvor i ispis ključa (minden csomó kulcsának értékének kiírása):
# function that writes the value of the key  funkcija koja ispisuje vrednost ključa (függvény, mely kiírja a csomók kulcsának értékét):
function printKey(t::RBTree, node::RBTNode)
    print(node.key, " ")
end

# function that visits every node in the tree  funkcija koja posećuje svaki čvor u stablu (függvény, mely átmegy minden csomón a fán belül):
function visit(t::RBTree, f)
    function visitNode(a::RBTNode, f)
        if a.leftSubTree != t.nil 
            visitNode(a.leftSubTree, f);
        end
        f(t, a);
        if a.rightSubTree != t.nil
            visitNode(a.rightSubTree, f);
        end
    end

    visitNode(t.root, f);
end

println("Keys to all nodes: ")
visit(t, printKey);
println();println();

t = RBTree();
for k in [12, 18, 5, 9, 2, 15, 17, 19, 13]
    add!(t, RBTNode(k))
end

println("Keys to all nodes: ")
visit(t, printKey);
println();println();

# example 12:   - counting black nodes  prebrojavanje crnih čvorova u CCStablu (fekete színű csomók megszámolása a vörös-fekete fában):
# a function that prints the number of black nodes in the path  funkcija koja ispisuje broj crnih čvorova na putanji (függvény, mely megszámolja a fekete színű csomókat):
function printNumberofBlackNodesOnPath(t::RBTree, a::RBTNode)
    if a.leftSubTree == t.nil && a.rightSubTree == t.nil
        m = 0;
        print(a.key,"-");
        while a != t.nil
            if a.color == BLACK
                m += 1;
            end
            a = a.parent;
        end
        print(m, " ");
    end
end

println("Number of black nodes : ");
visit(t, printNumberofBlackNodesOnPath);
println();

t = RBTree();
for k in shuffle(1:25)
    add!(t, RBTNode(2*k))
end

println("Number of black nodes : ");
visit(t, printNumberofBlackNodesOnPath);
println();println();

# example 12:   - red-black tree rules check  provera ispravnosti CCStabla (a vörös-fekete fa szabalyainak tesztelése):
# red-black tree rules check  funkcija koja testira pravila CCStabla (függvény, mely ellenőrzi a vörös-fekete fa szabalyait):
function testRBTree(t::RBTree, a::RBTNode)
    if a.parent == t.nil
        if a.color != BLACK
            println("Oops, root must be black!");
        end 
    else
        if a.color == RED && a.parent.color == RED
            println("Oops, two red in a row!");
        end
        if a.color == RED && a.leftSubTree.color != BLACK && a.rightSubTree.color != BLACK
            println("Oops, red doesn't have both blacks!");
        end
    end
end

print("Test Red-Black Tree rules: ")
visit(t, testRBTree);
println();