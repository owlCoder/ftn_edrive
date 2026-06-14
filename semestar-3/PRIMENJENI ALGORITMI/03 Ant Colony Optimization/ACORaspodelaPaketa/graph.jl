mutable struct Graph
    adjMatrix::Array{Int64, 2}
    pheromoneMatrix::Array{Float64}
    nodesCount::Int64
end

function generateGraph(nodesCount, adjMatrix)
    pheromoneMatrix = ones(Float64, (nodesCount, nodesCount))
    graph = Graph(adjMatrix, pheromoneMatrix, nodesCount)
    return graph
end