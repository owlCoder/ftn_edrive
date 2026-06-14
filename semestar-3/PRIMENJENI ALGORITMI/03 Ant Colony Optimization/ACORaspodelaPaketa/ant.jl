mutable struct Ant
    route::Array{Int64, 1}
    currentNodeIndex::Int64
    fitness::Int64
end

function generateAntPopulation(antsCount, possibleStartNodesRange)
    ants::Array{Ant, 1} = []
    for i in 1:antsCount
        push!(ants, Ant([], possibleStartNodesRange, 0))
    end
    return ants
end