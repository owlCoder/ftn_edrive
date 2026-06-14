include("student.jl")
include("program.jl")

print("Unesite broj indeksa\n>> ")
in = readline()

ključ = parse(Int, in)
indeks = binarnaPretraga(studenti, ključ)

if indeks == -1
    println("\nNema studenta sa brojem indeksa $ključ.")
else
    moduoBroja = studenti[indeks].brojIndeksa

    if moduoBroja % 4 == 0
        grupaVežbe = grupaVežbe = Int(floor(studenti[indeks].brojIndeksa / 4) ) 
    elseif (studenti[indeks].brojIndeksa / 4) < Int(floor(studenti[indeks].brojIndeksa / 4))
        grupaVežbe = Int(floor(studenti[indeks].brojIndeksa / 4))
    else
        grupaVežbe = Int(ceil(studenti[indeks].brojIndeksa / 4))  
    end

    println("\nIme:            $(studenti[indeks].ime)")
    println("Prezime:          $(studenti[indeks].prezime)")
    println("Broj indeksa:     $(studenti[indeks].brojIndeksa)")
    println("Grupa za vežbe:   $(grupaVežbe)")
    println()
end
