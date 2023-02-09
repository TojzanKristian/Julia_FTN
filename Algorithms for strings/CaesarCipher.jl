function caesarCipher(message, move)
    result = []
    for i in message
        positionASCII = Int(i) + move
        i = Char(positionASCII)
        push!(result, i)
    end
    join(result)
end