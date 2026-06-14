function uporedi(k1, k2)
    return k1.brojPoena > k2.brojPoena || k1.brojPoena == k2.brojPoena && k1.brojPatika > k2.brojPatika
end

function insertionSort!(kosarkasi)
    n = length(kosarkasi)

    for j in 2:n
        key = kosarkasi[j]
        i = j - 1

        while i > 0 && uporedi(kosarkasi[i], key)
            kosarkasi[i + 1] = kosarkasi[i]
            i -= 1
        end
        kosarkasi[i + 1] = key
    end
end