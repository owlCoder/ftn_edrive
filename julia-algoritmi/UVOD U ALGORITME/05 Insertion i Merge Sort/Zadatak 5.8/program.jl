function grupisanje(studenti, brojPoGrupi)
    brojGrupa = Int(floor(length(studenti) / brojPoGrupi))
    grupa = 1
    brojac = 1

    for i in 1:brojGrupa
        println("\n------------- GRUPA $grupa --------------")
        println("\nRB  Ime\t       Prezime    Ind  Poeni")
        ispisStudenataUIntervalu(studenti, brojac, brojac + brojPoGrupi - 1)
        grupa += 1
        brojac += brojPoGrupi
    end

    if brojac < length(studenti)  # da li su ostali negrupisani studenti?
        println("\n------------- GRUPA $grupa --------------")
        println("\nRB  Ime\t       Prezime    Ind  Poeni")
        ispisStudenataUIntervalu(studenti, brojac, brojac + (length(studenti) - brojac))
    end
end