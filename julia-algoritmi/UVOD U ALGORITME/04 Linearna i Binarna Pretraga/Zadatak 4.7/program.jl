#  Zadatak 4.7. Implementirati algoritam koji pronalazi indekse svih elemenata u
# sortiranom nizu čija je vrednost jednaka vrednosti ulaznog parametra (ključa).
# Modifikovati algoritam rekurzivne binarne pretrage. 

function binarnaPretraga(A, ključ)
    return rekurzivniBinarniKorak(A, 1, length(A), ključ);
end

function rekurzivniBinarniKorak(A, početak, kraj, ključ)
    if (početak > kraj)
        return -1
    else
        sredina = Int(floor((početak + kraj) / 2))
        
        if A[sredina] == ključ
            return sredina
        elseif (A[sredina] > ključ)
            return rekurzivniBinarniKorak(A, početak, sredina - 1, ključ);
        else
            return rekurzivniBinarniKorak(A, sredina + 1, kraj, ključ);
        end
    end
end 


