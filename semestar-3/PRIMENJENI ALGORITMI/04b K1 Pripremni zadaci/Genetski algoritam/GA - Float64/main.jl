include("geneticAlgorithm.jl")

genesLength = 8
elitePercentage = 0.25
mutationPercentage = 0.36
crossoverPoint = 5
populationSize = 100

population = generatePopulation(genesLength, populationSize)
lenOfBF, population = geneticAlgorithm!(population, elitePercentage, crossoverPoint, mutationPercentage)
printPopulation(population)
println("\n\nNajmanja vrednost fitnessa je $(population[1].fitness)")
print("VREDNOSTI ")
printEntity(population[1])

##################### ANALYSE ######################

include("analyze.jl")

crossoverRange = collect(2:6)
num = 10

println("\n\n---------------- AVERAGE ------------------\n")
populacija = generatePopulation(genesLength, populationSize)
avgGen, avgFit = calculateAverage(populacija, elitePercentage, crossoverPoint, mutationPercentage, num)
println("Avg gen $avgGen, avg fit $avgFit")

println("\n\n---------------- ANALYSE ------------------\n")
pop = generatePopulation(populationSize, genesLength)
minCrossoverIndex, minFit = findBestCrossover(pop, elitePercentage, crossoverRange, mutationPercentage, num)
println("Najbolji indeks crossovera je $minCrossoverIndex, min avg fit je: $minFit")
