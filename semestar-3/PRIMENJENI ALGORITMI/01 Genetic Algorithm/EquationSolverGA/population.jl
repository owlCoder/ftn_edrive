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
    @printf("\n%7s  %7s  %7s  %7s  %7s  %7s  %7s\n", "x", "y", "z", "w", "u", "v", "   fitness")
    for i in 1:length(data)
        printEntity(data[i])
    end
end

function selectPopulation(data, n)
    return copy(data[1:n])
end

function calculatePopulationFitness!(data)
    for i in 1:length(data)
        calculateFitness!(data[i])
    end
    sort!(data, by = d -> d.fitness, rev = false)
end

function crossoverPopulation!(data, crossoverPoint)
    newData = []
    # sort postoji u kalkulaciji fitnessa populacije
    # sort!(data, by = d -> d.fitness, rev = false)
    for i in 1:2:length(data)
        ent1 = deepcopy(data[i])
        ent2 = deepcopy(data[i + 1])
        crossover!(ent1, ent2, crossoverPoint)
        push!(newData, ent1)
        push!(newData, ent2)
    end
    return newData
end

function mutatePopulation!(data, mutationPercentage)
    for i in 1:length(data)
        mutate!(data[i], mutationPercentage)
    end
end