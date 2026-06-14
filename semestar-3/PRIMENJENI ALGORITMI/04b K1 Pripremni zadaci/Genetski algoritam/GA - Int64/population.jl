include("entity.jl")

function generatePopulation(genesLength, n)
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
    for i in 1:3:length(data)
        if length(data) - i >= 3
            e1 = deepcopy(data[i])
            e2 = deepcopy(data[i + 1])
            e3 = deepcopy(data[i + 2])
            crossover!(e1, e2, e3, crossoverPoint)
            push!(newData, e1)
            push!(newData, e2)
            push!(newData, e3)
        elseif length(data) - i == 2 # fali jedan hromozom za ukrstanje
            e1 = deepcopy(data[i - 1])
            e2 = deepcopy(data[i])
            e3 = deepcopy(data[i + 1])
            crossover!(e1, e2, e3, crossoverPoint)
            push!(newData, e1)
            push!(newData, e2)
            push!(newData, e3)
        elseif length(data) - i <= 1 # fali dva hromozoma za ukrstanje
            e1 = deepcopy(data[i - 2])
            e2 = deepcopy(data[i - 1])
            e3 = deepcopy(data[i])
            crossover!(e1, e2, e3, crossoverPoint)
            push!(newData, e1)
            push!(newData, e2)
            push!(newData, e3)
        end
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