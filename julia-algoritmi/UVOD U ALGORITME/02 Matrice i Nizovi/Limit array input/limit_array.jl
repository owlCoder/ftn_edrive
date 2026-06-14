function proveriNiz(niz)
    manji1 = findall(niz .< 1)      # da li je broj manji od 1 ?
    veci100 = findall(niz .> 100)   # da li je broj veći od 100 ?

    if manji1 != [] || veci100 != []
        error("UNETI BROJEVI NISU U INTERVALU [1...100]!")
    end
end

A = [1 -5 62 12 645 51 154 1 54 54 189 41 951]
B = [1 5 62 12 64 51 14 1 54 54 89 41 51]
C = [1 5 62 12 101 51 54 1 4 5 19 41 51]

proveriNiz(A)
proveriNiz(B)
proveriNiz(C)