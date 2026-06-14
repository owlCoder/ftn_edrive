#== 
Zadatak 5.5. Napisati funkciju koja će sortirati redne brojeve kuća u ulici po rastućem
poretku koristeći Insertion sort metodu. Nakon toga, krirati skriptu koja će binarnom
pretragom pronaći kuću sa datim rednim brojem i ispisati da li se ona nalazi u prvoj ili
drugoj polovini ulice
==#

function binarnaPretraga(niz, ključ)
    pocetak = 1
    kraj = length(niz)

    while(pocetak <= kraj)
        sredina = Int(floor( (pocetak + kraj) / 2 ))

        if(niz[sredina] == ključ)
            return sredina
        elseif(niz[sredina] < ključ)
            pocetak = sredina + 1
        else
            kraj = sredina  - 1
        end
    end
    return -1
end