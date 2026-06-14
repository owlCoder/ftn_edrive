include("analyse.jl")
include("referenceGenerator.jl")

numberOfParticles = 10
numberOfOperands = 10 
minRang = -1
maxRang = 1
targetValue = 10 
maxIteration = 100
maxVelocity = 0.1
maxVelocityRange = collect(1:10)
num = 10
X = generateReferentParticle(numberOfOperands, minRang, maxRang)

#########################################################

####################### MAIN_TEST #######################
swarm = generateSwarm(numberOfParticles, numberOfOperands, minRang, maxRang, X)
PsoAlgorithm!(swarm, targetValue, maxIteration, maxVelocity, X)

#########################################################

##################### ANALYSE_TEST ######################
println("\n\n---------------- AVERAGE ------------------\n")
swarmAvg = generateSwarm(numberOfParticles, numberOfOperands, minRang, maxRang, X)
averageBestValue = calculateAverage(swarm, targetValue, maxIteration, maxVelocity, X, num)
println("Avg best iznosi $averageBestValue")

println("\n\n---------------- ANALYSE ------------------\n")
swarmMaxVelocity = generateSwarm(numberOfParticles, numberOfOperands, minRang, maxRang, X)
minIdx = findBestMaxVelocity(swarm, targetValue, maxIteration, maxVelocityRange, X, num)
println("Najbolji indeks za maxVelocity je $minIdx\nVELOCITIES: $maxVelocityRange")