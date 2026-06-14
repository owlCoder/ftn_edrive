include("entity.jl")

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

function selectPopulation(data, n)
    return copy(data[1:n])
end

function calculatePopulationFitness!(data, fitValue)
    for i in 1:length(data)
        calculateFitness!(data[i], fitValue)
    end
    sort!(data, by = d -> d.fitness, rev = false)
end

function crossoverPopulation!(data, crossoverPoint)
    newData = []
    for i in 1:length(data)
        for j in 1:length(data)
            ent1 = deepcopy(data[i])
            ent2 = deepcopy(data[j])
            crossover!(ent1, ent2, crossoverPoint)
            push!(newData, ent1)
            push!(newData, ent2)
        end
    end
    return newData
end

function mutatePopulation!(data, mutationPercentage)
    for i in 1:length(data)
        mutate!(data[i], mutationPercentage)
    end
end