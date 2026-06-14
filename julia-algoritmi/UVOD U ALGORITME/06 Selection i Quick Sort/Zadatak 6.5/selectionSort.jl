function selectionSort!(recnici)
    n = length(recnici)

    for i in 1:(n - 1)
        minIndeks = i

        for j in (i + 1):n
            if uporedi(recnici[j], recnici[minIndeks])
                minIndeks = j
            end
        end

        if i != minIndeks
            recnici[[i minIndeks]] = recnici[[minIndeks i]]
        end
    end
end
