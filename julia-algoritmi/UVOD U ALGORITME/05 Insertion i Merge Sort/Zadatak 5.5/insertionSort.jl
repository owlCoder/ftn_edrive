#== 
Zadatak 5.5. Napisati funkciju koja će sortirati redne brojeve kuća u ulici po rastućem
poretku koristeći Insertion sort metodu. Nakon toga, kreirati skriptu koja će binarnom
pretragom pronaći kuću sa datim rednim brojem i ispisati da li se ona nalazi u prvoj ili
drugoj polovini ulice
==#

function uporedi(prvi, drugi)
    return prvi < drugi
end

function insertionSort!(niz)
    for j in 2:length(niz)
        ključ = niz[j]
        i = j - 1

        while(i > 0 && uporedi(ključ, niz[i]))
            niz[i + 1] = niz[i]
            i = i - 1
        end
    niz[i + 1] = ključ
    end
end
