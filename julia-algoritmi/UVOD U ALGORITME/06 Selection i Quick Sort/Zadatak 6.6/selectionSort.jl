function selectionSort!(kosarkasi)
    n = length(kosarkasi)

    for i in 1:(n - 1)
        minIndeks = i

        for j in (i + 1):n
            if uporedi(kosarkasi[j], kosarkasi[i])
                minIndeks = j
            end
        end

        if i != minIndeks
            kosarkasi[[i minIndeks]] = kosarkasi[[minIndeks i]]
        end
    end
end