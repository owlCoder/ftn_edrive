# Zadatak 8: Napisati funkciju koja određuje poziciju nenultih elemenata proizvoljne matrice.
# Zadatak rešiti bez korišćenja funkcije findall.
function indeksiNenultihElemenata(A)
    indeksi = []
    dimenzije = size(A)

    for i in 1:dimenzije[1]
        for j in 1:dimenzije[2]
            if A[i, j] != 0
                push!(indeksi, [i, j])
            end
        end
    end

    return indeksi
end

A = [0 0 5; 0 2 3]
println("Indeksi nenultih elemenata matrice A su: ", indeksiNenultihElemenata(A))