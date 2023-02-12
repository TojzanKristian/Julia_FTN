function radixSort(A)
    maxval = maximum(A);
    digits = 0;
    
    while maxval >= 1
        maxval /= 10;
        digits += 1;
    end
    
    for digit in 1:digits 
        digit_sort = [[] for _ in 1:10];
        radix = 10^(digit-1);
        
        for i in A       
            ind = fld(i,radix)%10; 
            push!(digit_sort[ind+1],i);
        end

        A = [];

        for j in 1:10            
            append!(A,digit_sort[j]);
        end
    end

    return A;
end