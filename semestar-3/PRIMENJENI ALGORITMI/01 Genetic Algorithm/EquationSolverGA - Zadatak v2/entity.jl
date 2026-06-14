using Printf

mutable struct Entity
    genes::Array{Float64, 1}
    fitness::Float64
end

function generateEntity(genesLenght)
    return Entity(rand(-1:0.1:1, genesLenght), 0)
end

function printEntity(entity)
    for i in 1:length(entity.genes)
        @printf("%7.2f  ", entity.genes[i])
    end
    @printf("\t%7.2f\n" , entity.fitness)
end

function calculateFitness!(entity)
    entity.fitness = 0
    entity.fitness = 4 * (entity.genes[1]^2) - (6 * entity.genes[1]) - (3 * (entity.genes[2]^3)) + (0.5 * entity.genes[2])
    entity.fitness += (3 * (entity.genes[3])) + (8 * (entity.genes[4])) - (6.1 * (entity.genes[5])) + (2 * entity.genes[6])
    entity.fitness -= 10 
    # println("FITNES $(entity.fitness)")
    entity.fitness = abs(entity.fitness)
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
        mutationPoint = rand(1:length(entity.genes))
        if(entity.genes[mutationPoint] > 0)
            entity.genes[mutationPoint] = entity.genes[mutationPoint] - 0.1
        else
            entity.genes[mutationPoint] = entity.genes[mutationPoint] + 0.1
        end
    end
end