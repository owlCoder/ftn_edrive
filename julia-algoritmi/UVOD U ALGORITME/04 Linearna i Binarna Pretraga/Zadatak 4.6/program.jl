# Zadatak 4.6. Implementirati algoritam koji pronalazi sve studente sa prosečnom
# ocenom u određenom opsegu i ispisuje njihove podatke. Prvi ulazni parametar
# funkcije je niz struktura koje predstavljaju studente i imaju polja: brIndeksa, ime,
# prezime, ocena. Drugi ulazni parametar funkcije je vektor od 2 elementa koji
# predstavljaju granice opsega. Modifikovati algoritam linearne pretrage.

function linearnoPretraži(Studenti, Opseg)
    nadjeno = []
    for i in 1:length(Studenti)
        if Studenti[i].ocena >= Opseg[1] && Studenti[i].ocena <= Opseg[2]
            push!(nadjeno, Studenti[i])
        end
    end
    return nadjeno, length(nadjeno)
end


