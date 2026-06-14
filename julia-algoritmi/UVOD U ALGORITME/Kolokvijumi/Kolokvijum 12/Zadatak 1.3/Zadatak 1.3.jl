# Ulazni parametri kvadratna matrica A, skalar el1
# izlazni parametri vektor v (svi parni elementi ispod glavne dijagonale)
# i neparni na glavnoj dijagonali.
# skalar s je pojava elemenata el1 u matrici A.
# Rešiti pomoću petlji

function zadatak3(A, el1)
    vrste, kolone = size(A)
    v = []
    s = 0
    
    # parni ispod glavne dijagonale
    for i in 1:vrste
        for j in 1:kolone
            if (i > j) && (A[i, j] % 2 == 0)
                push!(v, A[i, j])
            end
            
            # broj pojava el1 u A
            if A[i, j] == el1
                s += 1
            end
        end
    end

    # neparni na glavnoj dijagonali
    for i in 1:vrste
        for j in 1:kolone
            if (i == j) && (A[i, j] % 2 != 0)
                push!(v, A[i, j])
            end
        end
    end

    return v, s
end

A = [1 4 3; 4 5 6; 3 15 9]
el1 = 3

v, s = zadatak3(A, el1)

if v == []
    println("No data.")
else
    print("Prikaz niza parni ispod glavne dijagonale i neparni na glavnoj dijagonali\n$v")
    println("\n\nBroj $el1 se pojavio $s puta.")
end
