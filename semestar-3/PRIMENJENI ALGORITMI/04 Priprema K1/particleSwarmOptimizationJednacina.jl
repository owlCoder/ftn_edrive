# PARTICLE.jl
mutable struct Particle
    values::Array{Float64, 1}
    currentValue::Float64
    velocity::Array{Float64, 1}
    bestValues::Array{Float64, 1}
    bestValue::Float64
end

function updateValue!(particle)
    x = particle.values[1]
    y = particle.values[2]
    z = particle.values[3]
    w = particle.values[4]
    u = particle.values[5]
    v = particle.values[6]
    particle.currentValue = 4*x^2 - 6*x - 3*y^3 + 0.5*y + 3*z + 8*w - 6.1*u +2*v - 10
end

function generateParticle(numberOfOperands, minRang, maxRang)
    particle = Particle(rand(minRang:0.1:maxRang, numberOfOperands), 
                       0, fill(0.0, numberOfOperands),
                       fill(0, numberOfOperands), 0)
    updateValue!(particle)
    particle.bestValues = copy(particle.values)
    particle.bestValue = particle.currentValue

    return particle
end

function printParticle(particle)
    x = particle.values[1]
    y = particle.values[2]
    z = particle.values[3]
    w = particle.values[4]
    u = particle.values[5]
    v = particle.values[6]
    println("4*$x^2 - 6*$x - 3*$y^3 + 0.5*$y + 3*$z + 8*$w - 6.1*$u +2*$v - 10 = $(particle.currentValue)")
end

# Vi = Cv*Vi + Cp*Rp*(Pi-Xi) + Cg*Rg*(g-Xi)
# Xi - trenutna vrednost
# Pi - lokalno najbolja
# g  - globalno najbolja
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
        particle.values[i] += particle.velocity[i]

        if particle.values[i] > 1
            particle.values[i] = 1.0
        elseif particle.values[i] < -1
            particle.values[i] = -1.0
        end
    end
    updateValue!(particle)
    if abs(particle.currentValue - targetValue) < abs(particle.bestValue - targetValue)
        particle.bestValues = copy(particle.values)
        particle.bestValue  = particle.currentValue
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

# PARTICLESWARMOPTIMIZATIONALGORITHM.jl
function calculateGlobalBestParticle(swarm, targetValue, globalBestParticle)
    for i in 1:length(swarm)
        if abs(swarm[i].currentValue - targetValue) < abs(globalBestParticle.currentValue - targetValue)
            globalBestParticle = deepcopy(swarm[i])
        end
    end
    return globalBestParticle
end

function converge(bestValues)
    len = length(bestValues)
    if abs(bestValues[len]) < 0.001
        return true
    elseif len < 5
        return false
    else
        return abs(bestValues[len - 4] - bestValues[len]) < 0.001
    end
end

function PsoAlgorithm!(swarm, targetValue, maxIteration, maxVelocity)
    globalBestParticle = swarm[1]
    globalBestParticle = calculateGlobalBestParticle(swarm, targetValue, globalBestParticle)
    bestValues = [globalBestParticle.currentValue]

    for i in 1:maxIteration
        if converge(bestValues)
                printSwarm(swarm)
                println("RESENJE")
                printParticle(globalBestParticle)
                println("RESENJE PRONADJENO POSLE $i ITERACIJA.")
                return
        end
        updateSwarmVelocity!(swarm, globalBestParticle, maxVelocity)
        updateSwarmPosition!(swarm, targetValue)    
        globalBestParticle = calculateGlobalBestParticle(swarm, targetValue, globalBestParticle)
        bestValues = [bestValues; globalBestParticle.currentValue]
    end
    printSwarm(swarm)
    println("\nGLOBALNO RESENJE")
    printParticle(globalBestParticle)
end

# MAIN.jl
numberOfParticles = 10
numberOfOperands = 6 
minRang = -1
maxRang = 1
targetValue = 0 
maxIteration = 2000
maxVelocity = 0.2

swarm = generateSwarm(numberOfParticles, numberOfOperands, minRang, maxRang)
PsoAlgorithm!(swarm, targetValue, maxIteration, maxVelocity)