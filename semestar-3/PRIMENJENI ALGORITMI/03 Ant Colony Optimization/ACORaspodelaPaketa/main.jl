include("aco.jl")

maxIterations = 200
graphNodes = 5
antsNumber = 10
pheromoneDepositFactor = 1
evaporationRate = 0.1
pheromoneExponent = 1
desirabilityExponent = 2
graphAdjMatrix = [-1 500 400 500 800;
                  500 -1 200 200 300;
                  400 200 -1 300 500;
                  500 200 300 -1 200;
                  800 300 500 200 -1]

graph = generateGraph(graphNodes, graphAdjMatrix)
bestPath, bestFitness, graph = AntColonyOptimization!(graphNodes, maxIterations, antsNumber, pheromoneDepositFactor,
 evaporationRate, pheromoneExponent, desirabilityExponent, graph)

print("Mravi su pronasli najbolju putanju $(bestPath) cija duzina iznosi $(bestFitness)\n")
display(graph.pheromoneMatrix)