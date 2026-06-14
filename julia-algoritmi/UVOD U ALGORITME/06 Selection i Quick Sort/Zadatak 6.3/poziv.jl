# Zadatak 6.3. Implementirati Quick sort u Julia-i tako da sortira elemente niza brojeva
# u opadajućem redosledu. Prebrojati koliko različitih brojeva postoji.

include("quickSort.jl")

A = [2 19 5 19 7 1 14 9 1 1 22 1 8]
quickSort!(A)
println("Sortirani niz izgleda ovako: $A")

razliciti = []

for i in 1:length(A)
	if !(A[i] in razliciti)
		push!(razliciti, A[i])
	end
end

razBr = length(razliciti);
println("Razlicitih brojeva ima: $razBr")

