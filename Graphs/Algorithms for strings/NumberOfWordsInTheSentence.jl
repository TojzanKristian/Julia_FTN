function numberOfWords(sentence, character)
    n = 0
    for s in sentence
        if s == character
            n += 1
        end
    end
    n
end