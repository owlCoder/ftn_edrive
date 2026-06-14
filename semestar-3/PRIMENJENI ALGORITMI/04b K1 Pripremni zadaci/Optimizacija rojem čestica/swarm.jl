include("particle.jl")

function generateSwarm(numberOfParticles, numberOfOperands, minRang, maxRang, X)
    swarm = []
    for i in 1:numberOfParticles
        particle = generateParticle(numberOfOperands, minRang, maxRang, X)
        push!(swarm, particle)
    end
    return swarm
end

function printSwarm(swarm)
    for i in 1:length(swarm)
        printParticle(swarm[i])
    end
end

function updateSwarmVelocity!(swarm, globalBestParticle, maxVelocity, X)
    for i in 1:length(swarm)
        updateVelocity!(swarm[i], globalBestParticle, maxVelocity, X)
    end
end

function updateSwarmPosition!(swarm, targetValue, X)
    for i in 1:length(swarm)
        updatePosition!(swarm[i], targetValue, X)
    end
end