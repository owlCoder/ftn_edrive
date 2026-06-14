# Zadatak 6.7. Sortirati brojeve niza A opadajuće Quick sort algoritmom i za svaki broj
# iz niza B ispisati da li se nalazi u prvoj ili drugoj polovini sortiranog niza.

include("quickSort.jl")

A = [2 5 19 7 14 9 1 22 8]

quickSort!(A)
println("Sortirani niz izgleda ovako: $A\n")

B = copy(A)

polovina = Int(floor(length(B) / 2))

for i in 1:length(B)
    println("$(B[i])\t $(i <= polovina ? "PRVA POLOVINA" : "DRUGA POLOVINA")")
end