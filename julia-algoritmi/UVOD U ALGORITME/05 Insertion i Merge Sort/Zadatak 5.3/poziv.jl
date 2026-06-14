# Zadatak 5.3. Modifikovati Merge sort algoritam tako da sortira rastuće niz
# struktura studenti prema broju indeksa. Kreirati i skriptu koja kreira niz
# studenata i ispisuje ih sortirano na ekran

include("student.jl")
include("program.jl")

println("Spisak pre sortiranja")
ispisStudenata(studenti)

mergeSort!(studenti)

println("\nSpisak posle sortiranja")
ispisStudenata(studenti)

