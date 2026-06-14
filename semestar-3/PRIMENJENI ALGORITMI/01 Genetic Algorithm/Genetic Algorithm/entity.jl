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
    println("\t$(entity.fitness)")
end

function calculateFitness!(entity, fitValue)
    entity.fitness = 0
    for i in 1:length(entity.genes)
        entity.fitness += entity.genes[i]
    end
    entity.fitness = abs(entity.fitness - fitValue)
end

function crossover!(entity1, entity2, crossoverPoint)
    for i in 1:crossoverPoint
        x = entity1.genes[i]
        entity1.genes[i] = entity2.genes[i]
        entity2.genes[i] = x
    end
end

function mutate!(entity, mutationPercentage)
    if(rand(Float64) < mutationPercentage)
        mutationPoint = rand(1:genesLength)
        entity.genes[mutationPoint] = 1 - entity.genes[mutationPoint]
    end
end