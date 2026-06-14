# Zadatak 5.8 Napisati funkciju koja sortira niz studenata opadajuće po broju poena
# osvojenih na prijemnom ispitu, i skriptu koja ih ispisuje po grupama. U prvoj grupi se nalazi
# N najbolje plasiranih studenata po broju poena, u sledećoj grupi sledećih N studenata itd...

include("student.jl")
include("program.jl")
include("sortiraj.jl")

println("\n------------ PRE SORT --------------")
println("\nRB  Ime\t       Prezime    Ind  Poeni")
println("------------------------------------")
ispisStudenata(studenti)

println("\n------------ POST SORT -------------")
println("\nRB  Ime\t       Prezime    Ind  Poeni")
println("------------------------------------")
mergeSort!(studenti)
ispisStudenata(studenti)

brojPoGrupi = 5
println("\n------------ GRUPISANJE ------------")
grupisanje(studenti, brojPoGrupi)