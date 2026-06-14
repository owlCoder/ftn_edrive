# Zadatak 4.5. Implementirati algoritam koji u datom nizu pronalazi broj elemenata
# koji su manji ili jednaki sa datim elementom.

function linearnoPretraži(A, ključ)
    elementi = Int[]
    for i in 1:length(A)
        if A[i] <= ključ
            push!(elementi, A[i])
        end
    end
    return elementi, length(elementi)
end


