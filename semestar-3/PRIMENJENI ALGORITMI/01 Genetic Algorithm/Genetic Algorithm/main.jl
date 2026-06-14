include("geneticAlgorithm.jl")

genesLength = 20
populationSize = 20
fitValue = 19
crossoverPoint = 3
mutationPercentage = 0.2
selectionSize = 5
repeatSize = 3

population = generatePopulation(populationSize, genesLength)
calculatePopulationFitness!(population, fitValue)
printPopulation(population)

popGen, repeatNum, population = geneticAlgorithm!(population, fitValue, selectionSize, crossoverPoint, mutationPercentage, repeatSize)
printPopulation(population)

println("Ukupan broj generacije je $popGen")
println("Broj ponavljanja poslednjeg najboljeg fitnessa je $repeatNum")