#   PR55/2020 Danijel Jovanovic
#   Kreirati genetiski algoritam kojim se resava jednacina
# - 4x^2 - 6x - 3y^3 + 0.5y + 3z + 8w - 6.1u + 2v = 10
# - Resenje traziti u intervalu brojeva [-1, 1]
# - Ukrstanje vrsiti po parovima hromozoma, pocevsi od onih sa najmanjim fitnesom
# - Radi bolje konvergencije, korisitit elitu sa ucescem od 20%

include("geneticAlgorithm.jl")

genesLength = 6
populationSize = 50
crossoverPoint = rand(2:4) 
mutationPercentage = 0.2    
elitePercentage = 0.2    
repeatSize = 3             

population = generatePopulation(populationSize, genesLength)
calculatePopulationFitness!(population)
printPopulation(population)

popGen, repeatNum, population = geneticAlgorithm!(population, elitePercentage, crossoverPoint, mutationPercentage, repeatSize)
printPopulation(population)

println("\n\t\tUKUPAN BROJ GENERACIJA: $popGen")
println("\t\tCROSSOVER POINT: $crossoverPoint")
println("\t\tBR. PON. POSLEDNJEG BEST-FITA: $repeatNum.")