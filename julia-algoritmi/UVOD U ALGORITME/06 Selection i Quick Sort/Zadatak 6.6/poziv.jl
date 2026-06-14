# Zadatak 6.6. Sortirati niz košarkaša koristeći Selection sort algoritam rastuće po
# visini. Košarkaše sa istom visinom sortirati opadajuće po poziciji na kojoj igraju.
# Ispisati razliku u visini između najvišeg i najnižeg košarkaša

include("kosarkas.jl")
include("selectionSort.jl")

println("Nesortirani spisak košarkaša:")
ispisKošarkaša(košarkaši)
println()

selectionSort!(košarkaši)
println("Sortirani spisak košarkaša:")
ispisKošarkaša(košarkaši)

visine = []
for i in 1:length(košarkaši)
    push!(visine, košarkaši[i].visina)
end

razlika = maximum(visine) - minimum(visine)
d1, najvisi = findmax(visine)
d2, najnizi = findmin(visine)

println("\nNAJNIŽI KOŠARKAŠ")
@printf("%2i. %-15s %-15s %3i\n", najnizi, košarkaši[najnizi].ime, košarkaši[najnizi].prezime, košarkaši[najnizi].visina)

println("\nNAJVIŠI KOŠARKAŠ")
@printf("%2i. %-15s %-15s %3i\n", najvisi, košarkaši[najvisi].ime, košarkaši[najvisi].prezime, košarkaši[najvisi].visina)

println("\nRazlika u visini iznosi: $razlika cm.")