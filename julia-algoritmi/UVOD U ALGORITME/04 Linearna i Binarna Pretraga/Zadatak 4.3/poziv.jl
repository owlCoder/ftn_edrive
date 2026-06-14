include("program.jl")

niz = [11, 10, 9, 8, 7, 6, 5, 4]
ključ = 8

pretraženo = binarnoPretraži(niz, ključ)

if pretraženo == -1
    println("Ključ $ključ ne postoji u datom nizu:\n$niz")
else
    println("Ključ $ključ se nalazi u $(pretraženo <= length(niz) / 2 ? "prvoj" : "drugoj") polovini niza, na poziciji $pretraženo.")
end