include("program.jl")

niz = [11, 21, 9, 8, 11, 6, 32, 4]
ključ = 4

niz, brojElemenata = linearnoPretraži(niz, ključ)

if brojElemenata == 0
    println("Dati niz nema elemenata manjih od $ključ.")
else
    println("$brojElemenata elemenata niza su manji ili jednaki od $ključ.\nniz: $niz.")
end