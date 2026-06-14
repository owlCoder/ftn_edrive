mutable struct Entity
    genes::Array{Float64}
    fitness::Float64
end

function generateEntity(genesLength)
    return Entity(rand(-1:0.001:1, genesLength), 0.0)    
end

function printEntity(entity)
    x = entity.genes[1]
    y = entity.genes[2]
    z = entity.genes[3]

    println("3*$x + 2*$y - 10*$z = $(entity.fitness)")
end

function calculateFitness!(entity)
    x = entity.genes[1]
    y = entity.genes[2]
    z = entity.genes[3]

    entity.fitness = 3 * x + 2*y - 10*z
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
        
        if entity.genes[mutationPoint] > 0.0
            entity.genes[mutationPoint] -= 0.1
        else
            entity.genes[mutationPoint] += 0.1
        end
    end
end

function generatePopulation(genesLength, n)
    data = []
    for i in 1:n
        entity = generateEntity(genesLength)
        push!(data, entity)
    end
    return data
end

function calculatePopulationFitness!(data)
    for i in 1:length(data)
        calculateFitness!(data[i])
    end
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

function converge(bestFits)
    len = length(bestFits)
    if bestFits[len] < 0.001
        return true
    elseif len < 3
        return false
    elseif bestFits[len - 2] - bestFits[len] < 0.001
        return true
    else
        return false
    end
end

function geneticAlgorithm!(data, elitePercentage, crossoverPoint, mutationPercentage)
    calculatePopulationFitness!(data)
    bestFits = [data[1].fitness]

    populationSize = length(data)
    eliteSize = Int(trunc(populationSize * elitePercentage))
    eliteSize = eliteSize + (populationSize - eliteSize) % 2

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

genesLength = 3
populationSize = 1000
crossoverPoint = 3
mutationPercentage = 0.15
elitePercentage = 0.1

population = generatePopulation(populationSize, genesLength)
bf, population = geneticAlgorithm!(population, elitePercentage, crossoverPoint, mutationPercentage)
println("Najbolji fit $(population[1].fitness)")
printEntity(population[1])
