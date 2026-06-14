# Zadatak 4.1 Implementirati algoritam koji određuje broj pojavljivanja zadate vrednosti
# (ključa) u nizu sortiranom opadajuće. Modifikovati algoritam linearne pretrage. 

function linearnoPretrazi(A, kljuc)
    pojavilo = 0

    for i in 1:length(A)
        if A[i] == kljuc
            pojavilo = pojavilo + 1
        end
    end

    return pojavilo
end

