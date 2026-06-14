# ENTITY.jl
mutable struct Entity
    genes::Array{Float64, 1}
    fitness::Float64
end

function generateEntity(genesLength)
    return Entity(rand(-1.0:0.001:1, genesLength), 0)
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
function geneticAlgorithm!(data, elitePercentage, crossoverPoint, mutationPercentage, repeatSize)
    calculatePopulationFitness!(data)
    populationSize = length(data)
    popGen = 0
    bestFit = data[1].fitness
    repeatNum = 1
    eliteSize = Int(trunc(elitePercentage * populationSize))

    # Ako je velicina elite neparan broj dodaj 1
    eliteSize = eliteSize + (populationSize - eliteSize) % 2

    while (data[1].fitness > 0) && (repeatNum < repeatSize)
        elite = deepcopy(selectPopulation(data, eliteSize))
        data = selectPopulation(data, populationSize - eliteSize)
        data = crossoverPopulation!(data, crossoverPoint)
        mutatePopulation!(data, mutationPercentage)
        data = [data; elite]
        calculatePopulationFitness!(data)
        popGen += 1
        println("Generacija $popGen bestFit $bestFit broj ponavljanja $repeatNum")

        if abs(bestFit - data[1].fitness) < 0.01
            repeatNum += 1
        else
            bestFit = data[1].fitness
            repeatNum = 1
        end
    end
    return popGen, repeatNum, data
end

# MAIN.jl
genesLength = 6
populationSize = 50
crossoverPoint = 3
mutationPercentage = 0.2
elitePercentage = 0.2
repeatSize = 3

population = generatePopulation(populationSize, genesLength)
calculatePopulationFitness!(population)
printPopulation(population)
popGen, repeatNum, population = geneticAlgorithm!(population, elitePercentage, crossoverPoint, mutationPercentage, repeatSize)
printPopulation(population)
print("Ukupan broj generacija je $popGen \n")
print("Broj ponavljanja poslednjeg najboljeg finess-a je $repeatNum \n")
