# DYNAMIC PROGRAMMING

# dinamičko programiranje
# dinamikus programozás


# function that calculates the fibonacci number  funkcija koja računa fibonačijev broj (fibonacci számot kiszámító függvény):
function fibonacci(n)
    if n ≤ 2
        return 1;
    else 
        return fibonacci(n-1) + fibonacci(n-2);
    end
end

# Application of dynamic programming  primena paradigme dinamičkog programiranja (dinamikus programozás alkalmazása) :
# memory of fibonacci from top to bottom  memorisanje fibonačija od gore ka dole (fibonacci memorizálása fentről lefelé):
function fibFromUpToDown(n)
    function fib(n)
        if haskey(fibMemo, n)
            return fibMemo[n];
        end
        if n ≤ 2
            return 1;
        else 
            f = fib(n-1) + fib(n-2);
            fibMemo[n] = f;
            return f;
        end
    end

    fibMemo = Dict();
    fib(n);
end

# memory of fibonacci from down to top  memorisanje fibonačija od dole ka gore (fibonacci memorizálása letről felfelé):
function fibFromDownToUp(n)
    fibArray = zeros(Int64, n);
    fibArray[1] = 1;
    fibArray[2] = 1;
    for k = 3:n
        fibArray[k] = fibArray[k-1] + fibArray[k-2];
    end
    return fibArray[n];
end


# pipe cutting function  funkcija za sečenje cevi (függvény, amely a csővágást szimulálja):
function cuttingPipes(c, n)
    if n == 0
        return 0;
    end
    z = -Inf;
    for i = 1 : n
        z = max(z, c[i] + cuttingPipes(c, n-i));
    end
    return z;
end

# Application of dynamic programming  primena paradigme dinamičkog programiranja (dinamikus programozás alkalmazása) :
# memory of cutting pipes from up to bottom  memorisanje sečenja cevi od gore ka dole (a csővágás memorizálása felülről lefelé):
function cuttingPipesFromUpToDown(c, n)
    function cuttingPipesMemo(c, n, z)
        if z[n] >= 0
            return z[n];
        end
        q = 0;
        if n > 0
            q = -Inf;
            for k = 1 : n
                q = max(q, c[k] + cuttingPipesMemo(c,n-k,z));
            end
        end
        z[n] = q;
        return q;
    end

    z = Dict();
    for i = 0 : n
        z[i] = -Inf;
    end
    return cuttingPipesMemo(c, n, z);
end

# memory of cutting pipes from down to top  memorisanje sečenja cevi od dole ka gore (a csővágás memorizálása lentről felfelé):
function cuttingPipesFromDownToUp(c, n)
    z = Dict();
    s = Dict();
    z[0] = 0;

    for i = 1 : n
        q = -Inf;
        for k = 1 : i
            if q < c[k] + z[i-k];
                q = c[k] + z[i-k];
                s[i] = k;
            end
        end
        z[i] = q;
    end
    return z, s;
end

# function that prints the cutting  funkcija za ispis sečenja (egy függvény, amely kiírja a vágásokat):
function printCuts(c, n)
    z, s = cuttingPipesFromDownToUp(c, n)
    print(n, " profit ", z[n], " pipe length: ");
    while n > 0
        print( s[n], " ");
        n -= s[n];
    end
    println();
end