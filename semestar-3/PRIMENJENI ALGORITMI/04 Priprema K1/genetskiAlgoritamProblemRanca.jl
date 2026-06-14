# ENTITY.jl
mutable struct Entity
    genes::Array{Int64, 1}
    fitness::Int64
end

function generateEntity(genesLength)
    return Entity(rand(0:1, genesLength), 0)
end

function printEntity(entity)
    for i in 1:length(entity.genes)
        print(entity.genes[i])
    end
    println(entity.fitness)
end

function calculateFitness!(entity, values, weights, maxCapacity)
    selectedWeights = weights[entity.genes .== 1]
    sumSelectedWeights = sum(selectedWeights)
    if sumSelectedWeights > maxCapacity
        entity.fitness = sum(values)
    else
        notSelectedValues = values[entity.genes .== 0]
        entity.fitness = sum(notSelectedValues)
    end
end

function crossover!(entity1, entity2, crossoverPoint1, crossoverPoint2)
    for i in (crossoverPoint1 + 1):crossoverPoint2
        x = entity1.genes[i]
        entity1.genes[i] = entity2.genes[i]
        entity2.genes[i] = x
    end
end

function mutate!(entity, mutationPercentage)
    if rand(Float64) < mutationPercentage
        mutationPoint = rand(1:length(entity.genes))
        entity.genes[mutationPoint] = 1 - entity.genes[mutationPoint]
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

function calculatePopulationFitness!(data, values, weights, maxCapacity)
    for i in 1:length(data)
        calculateFitness!(data[i], values, weights, maxCapacity)
    end
    sort!(data, by = d -> d.fitness, rev = false)
end

function crossoverPopulation!(data, crossoverPoint1, crossoverPoint2)
    newData = []
    for i in 1:2:length(data)
        entity1 = deepcopy(data[i])
        entity2 = deepcopy(data[i + 1])
        crossover!(entity1, entity2, crossoverPoint1, crossoverPoint2)
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
    elseif bestFits[len - 2] == bestFits[len]
        return true
    else
        return false
    end
end

function geneticAlgorithm!(data, elitePercentage, crossoverPoint1, crossoverPoint2, mutationPercentage, values, weights, maxCapacity)
    calculatePopulationFitness!(data, values, weights, maxCapacity)
    populationSize = length(data)
    eliteSize = Int(trunc(populationSize * elitePercentage))

    # Ako je broj jedinki elite neparan, dodaj jos jednu jedinku do parnog broja
    eliteSize = eliteSize + (populationSize - eliteSize) % 2

    bestFits = [data[1].fitness]

    while !converge(bestFits)
        elite = deepcopy(selectPopulation(data, eliteSize))
        data = selectPopulation(data, populationSize - eliteSize)
        data = crossoverPopulation!(data, crossoverPoint1, crossoverPoint2)
        mutatePopulation!(data, mutationPercentage)
        data = [data; elite]
        calculatePopulationFitness!(data, values, weights, maxCapacity)
        bestFits = [bestFits; data[1].fitness]
    end
    return length(bestFits), data
end

# MAIN.jl
numberOfRocks = 20
values = rand(1:100, numberOfRocks)
weights = rand(1:10, numberOfRocks)
maxCapacity = 30
populationSize = 50
crossoverPoint1 = 7
crossoverPoint2 = 14
mutationPercentage = 0.1
elitePercentage = 0.1

population = generatePopulation(populationSize, numberOfRocks)
popGen, population = geneticAlgorithm!(population, elitePercentage, crossoverPoint1, crossoverPoint2, mutationPercentage, values, weights, maxCapacity)
printPopulation(population)
println("Ukupan broj kamenja je $numberOfRocks")
println("Tezine kamenja su $weights")
println("Vrednosti kamenja su $values")
println("Maksimalna tezina kamenja je $maxCapacity")
println("Rezultati: ")
sumWeights = sum(weights[population[1].genes.==1])

if sumWeights > maxCapacity
    println("Nije pronajdeno resenje")
else
    println("Tezina izabranog kamenja je: $sumWeights")
    value = sum(values[population[1].genes.==1])
    println("Vrednost izabranog kamenja je: $value")
    println("Ukupan broj generacija je $popGen")
    println("Idealna jedinka $(population[1])")
    println("Izabrana su kamenja sa rednim brojevima:")

    for i in 1:numberOfRocks
        if population[1].genes[i]==0
            print("$i ")
        end
    end
end