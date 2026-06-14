include("program.jl")

A = [16 2 3; 4 1 6; 7 8 9]

indeksMinVrste = minSumaVrsta(A)

display(A)
println("\nIndeks vrste sa najmanjom sumom: $indeksMinVrste")