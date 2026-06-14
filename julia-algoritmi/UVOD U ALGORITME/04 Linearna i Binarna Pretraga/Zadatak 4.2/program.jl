# Zadatak 4.2. Implementirati algoritam koji u nizu košarkaša pronalazi sve košarkaše
# koji igraju na datoj poziciji i viši su od date visine. Za svakog košarkaša zapamtiti
# ime, prezime, visinu i poziciju na kojoj igra. Modifikovati algoritam linearne pretrage.
# Ispisati sve podatke o pronađenim košarkašima,

function linearnoPretrazi(A, pozicija, visina)
    košarkaši = []

    for i in 1:length(A)
        if (A[i].Pozicija == pozicija && A[i].Visina >= visina)
            push!(košarkaši, A[i])
        end
    end

    return košarkaši
end

