# ENTITY.jl
mutable struct Entity
    genes::Array{Int64, 1}
    fitness::Int64
end

function generateEntity(genesLenght)
    return Entity(rand(0:1, genesLenght), 0)
end

function printEntity(entity)
    for i in 1:length(entity.genes)
        print(entity.genes[i])
    end
    print(" $(entity.fitness)\n")
end

function calculateFitness!(entity, fitValue)
    entity.fitness = 0
    for i in 1:length(entity.genes)
        entity.fitness += entity.genes[i]
    end
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
        mutationPoint = rand(1:genesLength)
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
            entity1 = deepcopy(data[i])
            entity2 = deepcopy(data[j])
            crossover!(entity1, entity2, crossoverPoint)
            push!(newData, entity1)
            push!(newData, entity2)
        end
    end
    return newData
end

function mutatePopulation!(data, mutationPercentage)
    for i in 1:length(data)
        mutate!(data[i], mutationPercentage)
    end
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
function geneticAlgorithm!(data, fitValue, selectionSize, crossoverPoint, mutationPercentage, repeatSize)
    calculatePopulationFitness!(data, genesLength)
    popGen = 0
    bestFit = data[1].fitness
    repeatNum = 1

    while (data[1].fitness > 0) && (repeatNum < repeatSize)
        data = selectPopulation(data, selectionSize)
        data = crossoverPopulation!(data, crossoverPoint)
        mutatePopulation!(data, mutationPercentage)
        calculatePopulationFitness!(data, genesLength)
        popGen += 1
        println("Generacija $popGen bestFit $bestFit broj ponavljanja $repeatNum")

        if bestFit == data[1].fitness
            repeatNum += 1
        else
            bestFit = data[1].fitness
            repeatNum = 1
        end
    end
    return popGen, repeatNum, data
end

# MAIN.jl
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
popGen, repeatNum, population = geneticAlgorithm!(population, fitValue,
selectionSize, crossoverPoint, mutationPercentage, repeatSize)
printPopulation(population)
print("Ukupan broj generacija je $popGen \n")
print("Broj ponavljanja poslednjeg najboljeg finess-a je $repeatNum \n")