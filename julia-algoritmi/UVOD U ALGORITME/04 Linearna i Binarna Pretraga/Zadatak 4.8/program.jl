# Zadatak 4.8. Implementirati algoritam koji u nizu studenata sortiranog po broju
# indeksa pronalazi studenta sa datim indeksom i ispisuje u kojoj grupi za vežbe se
# on nalazi. U svakoj grupi, nalazi se po 4 studenta. Student je dat sa svojim
# imenom, prezimenom i brojem indeksa.

function binarnaPretraga(A, brojIndeksa)
    return rekurzivniBinarniKorak(A, 1, length(A), brojIndeksa);
end

function rekurzivniBinarniKorak(A, početak, kraj, brojIndeksa)
    if (početak > kraj)
        return -1
    else
        sredina = Int(floor((početak + kraj) / 2))
        
        if A[sredina].brojIndeksa == brojIndeksa
            return sredina
        elseif (A[sredina].brojIndeksa > brojIndeksa)
            return rekurzivniBinarniKorak(A, početak, sredina - 1, brojIndeksa);
        else
            return rekurzivniBinarniKorak(A, sredina + 1, kraj, brojIndeksa);
        end
    end
end 


