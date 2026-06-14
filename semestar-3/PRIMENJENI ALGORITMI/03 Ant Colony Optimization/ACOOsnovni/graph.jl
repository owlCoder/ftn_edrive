mutable struct Graph
    adjMatrix::Array{Int64, 2}
    pheromoneMatrix::Array{Float64}
    foodIndex::Int64
    nodesCount::Int64
end

function generateGraph(nodesCount, adjMatrix, foodIndex)
    pheromoneMatrix = ones(Float64, (nodesCount, nodesCount))
    graph = Graph(adjMatrix, pheromoneMatrix, foodIndex, nodesCount)
    return graph
end