mutable struct Entity
    genes::Array{Float64, 1}
    fitness::Float64
end

function generateEntity(genesLength)
    return Entity(rand(0:0.1:1, genesLength), 0.0)
end

function printEntity(entity)
    a = entity.genes[1]
    b = entity.genes[2]
    c = entity.genes[3]
    d = entity.genes[4]
    e = entity.genes[5]
    f = entity.genes[6]
    g = entity.genes[7]
    h = entity.genes[8]

    println("4*$a + 8*$b - 16*$c + 12*$d + 4*$e - 16*$f + 6*$g - 12*$h - 61 = $(entity.fitness)")
end

function calculateFitness!(entity)
    a = entity.genes[1]
    b = entity.genes[2]
    c = entity.genes[3]
    d = entity.genes[4]
    e = entity.genes[5]
    f = entity.genes[6]
    g = entity.genes[7]
    h = entity.genes[8]

    entity.fitness = abs(4*a + 8*b - 16*c + 12*d + 4*e - 16*f + 6*g - 12*h - 61)
end

function crossover!(entity1, entity2, entity3, crossoverPoint)
    e1c_to_cp = deepcopy(entity1.genes[1:crossoverPoint])
    e2c_to_cp = deepcopy(entity2.genes[1:crossoverPoint])
    e3c_to_cp = deepcopy(entity3.genes[1:crossoverPoint])

    entity2.genes[1:crossoverPoint] = e1c_to_cp
    entity3.genes[1:crossoverPoint] = e2c_to_cp
    entity1.genes[1:crossoverPoint] = e3c_to_cp
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