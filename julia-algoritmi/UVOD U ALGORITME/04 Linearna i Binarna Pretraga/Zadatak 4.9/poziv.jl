include("program.jl") 

niz = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
kljuc1 = 11
kljuc2 = 1

indeks1 = binarnoPretraži(niz, kljuc1)
indeks2 = binarnoPretraži(niz, kljuc2)

if(indeks1 == -1 || indeks2 == -1)
    println("\nNe postoji traženi ključ u nizu!")
else
    println("\nDistanca: $(abs(indeks2 - indeks1))")
end
