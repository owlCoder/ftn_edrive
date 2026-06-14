include("aco.jl")

maxIterations = 200
graphNodes = 3
antsNumber = 40
antsStartNode = 1
foodNode = 3
pheromoneDepositFactor = 1
evaporationRate = 0.1
pheromoneExponent = 1
desirabilityExponent = 0.1

graph = generateGraph(graphNodes, [-1 50 100; 50 -1 60; 100 60 -1], foodNode)
bestPath, bestFitness, graph = AntColonyOptimization!(graphNodes, foodNode, maxIterations, antsNumber, pheromoneDepositFactor,
 evaporationRate, pheromoneExponent, desirabilityExponent, graph)

print("Mravi su pronasli najbolju putanju $(bestPath) cija duzina iznosi $(bestFitness)\n")
print(graph.pheromoneMatrix)