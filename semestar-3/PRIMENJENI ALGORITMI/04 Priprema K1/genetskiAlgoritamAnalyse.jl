# ENTITY.jl
mutable struct Entity
    genes::Array{Float64, 1}
    fitness::Float64
end

function generateEntity(genesLength)
    return Entity(rand(-1.0:0.0001:1, genesLength), 0)
end

function printEntity(entity)
    for i in 1:length(entity.genes)
        print("$(round.(entity.genes[i]; digits = 3)) ")
    end
    println("$(entity.fitness)")
end

function calculateFitness!(entity)
    x = entity.genes[1]
    y = entity.genes[2]
    z = entity.genes[3]
    w = entity.genes[4]
    u = entity.genes[5]
    v = entity.genes[6]

    entity.fitness = abs(4*x^2 - 6*x - 3*y^3 + 0.5*y + 3*z + 8*w - 6.1*u + 2*v - 10)
end

function crossover!(entity1, entity2, crossoverPoint)
    for i in 1:crossoverPoint
        x = entity1.genes[i]
        entity1.genes[i] = entity2.genes[i]
        entity2.genes[i] = x
    end
end

function mutate!(entity, mutationPercentage)
    if rand(Float64) < mutationPercentage
        mutationPoint = rand(1:length(entity.genes))
        
        if entity.genes[mutationPoint] > 0
            entity.genes[mutationPoint] -= 0.1 
        else
            entity.genes[mutationPoint] += 0.1 
        end
    end
end

# POPULATION.jl
function generatePopulation(n, genesLength)
    data = []
    for i in 1:n
        entity = generateEntity(genesLength)
        push!(data, entity)
    end
    return data
end

function printPopulation(data)
    for i in 1:length(data)
        printEntity(data[i])
     end
end

function calculatePopulationFitness!(data)
    for i in 1:length(data)
        calculateFitness!(data[i])
    end
    sort!(data, by = d -> d.fitness, rev = false)
end

function crossoverPopulation!(data, crossoverPoint)
    newData = []
    for i in 1:2:length(data)
        entity1 = deepcopy(data[i])
        entity2 = deepcopy(data[i + 1])
        crossover!(entity1, entity2, crossoverPoint)
        push!(newData, entity1)
        push!(newData, entity2)
    end
    return newData
end

function mutatePopulation!(data, mutationPercentage)
    for i in 1:length(data)
        mutate!(data[i], mutationPercentage)
    end
end

function selectPopulation(data, n)
    return copy(data[1:n])
end

# GENETICALGORITHM.jl
#=
1. Generisanje početne poopulacije
2. Računanje fitness-a za celu populaciju
3. Ponavljanje do pojave zasićenja
a. Izbor roditelja za ukrštanje
b. Ukrštanje
c. Mutacija
d. Računanje fitness-a
=#
function converge(bestFits)
    len = length(bestFits)
    if bestFits[len] < 0.01
        return true
    elseif len < 3
        return false
    elseif (bestFits[len - 2] - bestFits[len]) < 0.001
        return true
    else
        return false
    end
end

function geneticAlgorithm!(data, elitePercentage, crossoverPoint, mutationPercentage)
    calculatePopulationFitness!(data)
    populationSize = length(data)
    eliteSize = Int(trunc(elitePercentage * populationSize))

    # Ako je velicina elite neparan broj dodaj 1
    eliteSize = eliteSize + (populationSize - eliteSize) % 2
    bestFits = [data[1].fitness]

    while !converge(bestFits)
        elite = deepcopy(selectPopulation(data, eliteSize))
        data = selectPopulation(data, populationSize - eliteSize)
        data = crossoverPopulation!(data, crossoverPoint)
        mutatePopulation!(data, mutationPercentage)
        data = [data; elite]
        calculatePopulationFitness!(data)
        bestFits = [bestFits; data[1].fitness]
    end
    return length(bestFits), data
end

# ANALYZE.jl
function calculateAverage(data, elitePercentage, crossoverPoint, mutationPercentage, num)
    averageGen = 0.0
    averageFit = 0.0
    for i in 1:num
        gen, pop = geneticAlgorithm!(data, elitePercentage, crossoverPoint, mutationPercentage)
        averageGen += gen
        averageFit += pop[1].fitness
    end
    averageGen /= num
    averageFit /= num

    return averageGen, averageFit
end

function findBestElitePercentage(data, eliteRange, crossoverPoint, mutationPercentage, num)
    resultsFit = []
    resultsGen = []
    for elitePercentage in eliteRange
        dataCopy = deepcopy(data)
        averageGen, averageFit = calculateAverage(dataCopy, elitePercentage, crossoverPoint, mutationPercentage, num)
        push!(resultsFit, averageFit)
        push!(resultsGen, averageGen)
    end
    minIndex = argmin(resultsFit)
    optimalValue = resultsFit[minIndex]
    return minIndex, optimalValue, resultsFit, resultsGen
end

function findBestCrossoverAndMutation(data, elitePercentage, crossoverRange, mutationRange, num)
    resultsFit = ones(length(crossoverRange), length(mutationRange))
    resultsGen = ones(length(crossoverRange), length(mutationRange))

    for i in 1:length(crossoverRange)
        crossoverPoint = crossoverRange[i]

        for j in 1:length(mutationRange)
            mutationPoint = mutationRange[j]
            dataCopy = deepcopy(data)
            averageGen, averageFit = calculateAverage(dataCopy, elitePercentage, crossoverPoint, mutationPercentage, num)
            resultsFit[i, j] = averageFit
            resultsGen[i, j] = averageGen
        end
    end
    cordinates = argmin(resultsFit)
    minCrossoverIndex = cordinates[1]
    minMutationIndex = cordinates[2]
    optimalValue = resultsFit[minCrossoverIndex, minMutationIndex]

    return minCrossoverIndex, minMutationIndex, optimalValue, resultsFit, resultsGen
end

# MAIN.jl
genesLength = 6
populationSize = 50
crossoverPoint = 3
crossoverRange = collect(2:5)
mutationPercentage = 0.1
mutationRange = collect(0:0.01:0.3)
elitePercentage = 0.1
eliteRange = collect(0:0.01:0.3)
numOfIterations = 200

population = generatePopulation(populationSize, genesLength)

minIndex, optimalElite, resultsFit, resultsGen = 
    findBestElitePercentage(population, eliteRange, crossoverPoint, mutationPercentage, numOfIterations)
println("Detekcija optimalnih vrednosti za procenat elite u populaciji")
println("Vrednost procenta elite za detekciju: $eliteRange")
println("Najbolji prosecan fitness : $optimalElite")
println("Redni broj optimalnog procenta elite u nizu: $minIndex")
println("Najbolji procenat elite: $(eliteRange[minIndex])")
println("Prosecna vrednost fitnesa: $(round.(resultsFit, digits = 4))")
println("Prosecan broj generacija: $resultsGen")

minCrossIndex, minMutIndex, optimalValue, resultsFit, resultsGen = findBestCrossoverAndMutation(population, elitePercentage, crossoverRange, mutationRange, numOfIterations)
println()
println("Detekcija optimalnih vrednosti za tacku ukrstanja i procenat mutacije u populaciji")
println("Vrednost tacke ukrstanja za detekciju: $crossoverRange")
println("Vrednost procenta mutacije za detekciju: $mutationRange")
println("Najbolji prosecan fitness : $optimalValue")
println("Najbolja tacka ukrstanja: $(crossoverRange[minCrossIndex])")
println("Najbolji procenat mutacije: $(mutationRange[minMutIndex])")
println("Prosecne vrednosti fitnesa:")
display(transpose(round.(resultsFit, digits = 4)))
println("Prosecan broj generacija:")
display(transpose(resultsGen))
