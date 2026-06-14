# PR55-2020 Danijel Jovanović

include("kosarkas.jl")
include("insertionSort.jl")

println("Nesortirani spisak košarkaša:")
ispisKošarkaša(košarkaši)
println()

insertionSort!(košarkaši)
println("Sortirani spisak košarkaša:")
ispisKošarkaša(košarkaši)

println("\nSortirani spisak košarkaša sa brojem poena > 150:")

for i in 1:length(košarkaši)
    if košarkaši[i].brojPoena > 150
        @printf("%2i. %-15s %3i %.2f\n", i, košarkaši[i].ime, košarkaši[i].brojPoena, košarkaši[i].brojPatika)
    end
end