# PARTICLE.jl
mutable struct Particle
    values::Array{Int64, 1}
    currentValue::Int64
    velocity::Array{Float64, 1}
    bestValues::Array{Float64, 1}
    bestValue::Int64
end

function updateValue!(particle)
    particle.currentValue = sum(particle.values)
end

function generateParticle(numberOfOperands, minRang, maxRang)
    particle = Particle(rand(minRang:maxRang, numberOfOperands), 
                        0, fill(0.0, numberOfOperands), 
                        fill(0, numberOfOperands), 0)
    updateValue!(particle)
    particle.bestValues = copy(particle.values)
    particle.bestValue = particle.currentValue

    return particle
end

function printParticle(particle)
    for i in 1:length(particle.values)
        if i < length(particle.values)
            print(particle.values[i], " + ")
        else
            print(particle.values[i], " = ")
        end
    end
    println(particle.currentValue)
end

# Vi = Cv*Vi + Cp*Rp*(Pi-Xi) + Cg*Rg*(g-Xi)
# Xi - trenutna vrednost
# Pi - lokalno najbolja
# g - globalno najbolja
# Cv = 1 Cp = 2 Cg = 2
function updateVelocity!(particle, globalBestParticle, maxVelocity)
    rp = rand(Float64)
    rg = rand(Float64)
    for i in 1:length(particle.velocity)
        particle.velocity[i] = 1.0 * particle.velocity[i] +
                               2.0 * rp * (particle.bestValues[i] - particle.values[i]) +
                               2.0 * rg * (globalBestParticle.values[i] - particle.values[i])

        if particle.velocity[i] > maxVelocity
            particle.velocity[i] = maxVelocity
        elseif particle.velocity[i] < -maxVelocity
            particle.velocity[i] = -maxVelocity
        end
    end
end

function updatePosition!(particle, targetValue)
    for i in 1:length(particle.values)
        particle.values[i] += trunc(Int64, particle.velocity[i])
    end
    updateValue!(particle)

    if abs(particle.currentValue - targetValue) < abs(particle.bestValue - targetValue)
        particle.bestValues = copy(particle.values)
        particle.bestValue = particle.currentValue
    end
end

# SWARM.jl
function generateSwarm(numberOfParticles, numberOfOperands, minRang, maxRang)
    swarm = []
    for i in 1:numberOfParticles
        particle = generateParticle(numberOfOperands, minRang, maxRang)
        push!(swarm, particle)
    end
    return swarm
end

function printSwarm(swarm)
    for i in 1:length(swarm)
        printParticle(swarm[i])
    end
end

function updateSwarmVelocity!(swarm, globalBestParticle, maxVelocity)
    for i in 1:length(swarm)
        updateVelocity!(swarm[i], globalBestParticle, maxVelocity)
    end
end

function updateSwarmPosition!(swarm, targetValue)
    for i in 1:length(swarm)
        updatePosition!(swarm[i], targetValue)
    end
end

# PARTICLESWARMALGORITHM.jl
function calculateGlobalBestParticle(swarm, targetValue, globalBestParticle)
    for i in 1:length(swarm)
        if abs(swarm[i].currentValue - targetValue) < abs(globalBestParticle.currentValue - targetValue)
            globalBestParticle = deepcopy(swarm[i])
        end
    end
    return globalBestParticle
end

function PsoAlgorithm!(swarm, targetValue, maxIteration, maxVelocity)
    globalBestParticle = swarm[1]
    globalBestParticle = calculateGlobalBestParticle(swarm, targetValue, globalBestParticle)

    for i in 1:maxIteration
        if globalBestParticle.currentValue == targetValue
                printSwarm(swarm)
                println("RESENJE")
                printParticle(globalBestParticle)
                println("RESENJE PRONADJENO POSLE $i ITERACIJA.")
                return
        end
        updateSwarmVelocity!(swarm, globalBestParticle, maxVelocity)
        updateSwarmPosition!(swarm, targetValue)    
        globalBestParticle = calculateGlobalBestParticle(swarm, targetValue, globalBestParticle)
    end
    printSwarm(swarm)
    println("\nGLOBALNO RESENJE")
    printParticle(globalBestParticle)
end

# MAIN.jl
numberOfParticles = 10
numberOfOperands = 5 #n
minRang = 100
maxRang = 200
targetValue = 200 #s
maxIteration = 2000
maxVelocity = 10

swarm = generateSwarm(numberOfParticles, numberOfOperands, minRang, maxRang)
PsoAlgorithm!(swarm, targetValue, maxIteration, maxVelocity)
