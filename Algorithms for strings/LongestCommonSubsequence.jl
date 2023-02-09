function LCS(x, y)
    n, m = length(x), length(y)
    L = Array{Int16}(undef, n, m)
    b = Array{Char}(undef, n, m)

    for i = 1 : n
        for j = 1 : m
            if x[i] == y[j]
                L[i,j] = (i > 1 && j > 1 ? L[i-1,j-1] : 0) + 1
                b[i,j] = '\\'
            else
                h = (i > 1 ? L[i-1,j] : 0)
                v = (j > 1 ? L[i,j-1] : 0) 
                if h >= v
                    L[i,j] = h
                    b[i,j] = '|'
                else
                    L[i,j] = v
                    b[i,j] = '-'
                end
            end
        end
    end
    return (L, b)
end


function LCSPrint(b, x, i, j)
    if i == 0 || j == 0 
        return
    end
    if b[i,j] == '\\'
        LCSPrint(b, x, i-1, j-1)
        print(x[i])
    elseif b[i,j] == '|'
        LCSPrint(b, x, i-1, j)
    else
        LCSPrint(b, x, i, j-1)
    end
end