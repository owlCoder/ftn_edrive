# Zadatak 4.3 Neka je dat niz brojeva sortiran opadajuće. Implementirati algoritam koji
# određuje da li se uneti broj nalazi u prvoj ili drugoj polovini niza. Modifikovati
# algoritam binarne pretrage.  

function binarnoPretraži(A, ključ)
    početak = 1
    kraj = length(A)

    while početak <= kraj
        sredina = Int(floor( (početak + kraj) / 2))

        if A[sredina] == ključ
            return sredina
        elseif A[sredina] < ključ
            kraj = sredina - 1
        else
            početak = sredina + 1
        end
    end

    return -1
end


