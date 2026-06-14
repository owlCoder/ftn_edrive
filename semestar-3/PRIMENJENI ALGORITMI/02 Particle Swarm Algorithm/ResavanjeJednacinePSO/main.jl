include("pso.jl")

numberOfParticles = 100
numberOfOperands = 10           # n
minRang = 100
maxRang = 200
targetValue = 400               # s
maxIteration = 1000
maxVelocity = 10

swarm = generateSwarm(numberOfParticles, numberOfOperands, minRang, maxRang)
PSOAlgorithm!(swarm, targetValue, maxIteration, maxVelocity)