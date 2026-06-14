include("algorithm.jl")

numberOfParticles = 10
numberOfOperands = 3        # n
minRang = 140
maxRang = 190
targetValue = 100           # s
maxIteration = 200
maxVelocity = 10

swarm = generateSwarm(numberOfParticles, numberOfOperands, minRang, maxRang)
PsoAlgorithm(swarm, targetValue, maxIteration, maxVelocity)