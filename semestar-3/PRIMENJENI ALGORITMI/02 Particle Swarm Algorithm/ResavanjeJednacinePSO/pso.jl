include("swarm.jl")

function calculateGlobalBestParticle(swarm, targetValue, globalBestParticle)
    for i in 1:length(swarm)
        if abs(swarm[i].currentValue - targetValue) < abs(globalBestParticle.currentValue - targetValue)
            globalBestParticle = deepcopy(swarm[i])
        end
    end
    return globalBestParticle
end

function PSOAlgorithm!(swarm, targetValue, maxIteration, maxVelocity)
    globalBestParticle = swarm[1]
    globalBestParticle = calculateGlobalBestParticle(swarm, targetValue, globalBestParticle)

    for i in 1:maxIteration
        if globalBestParticle.currentValue == targetValue
            printSwarm(swarm)
            println("RESENJE")
            printParticle(globalBestParticle)
            println("RESENJE PRONADJEDNO POSLE $i iteracija.")
            return
        end
        updateSwarmVelocity!(swarm, globalBestParticle, maxVelocity)
        updateSwarmPosition!(swarm, targetValue)
        globalBestParticle = calculateGlobalBestParticle(swarm, targetValue, globalBestParticle)
    end
    printSwarm(swarm)
    println("\nGLOBALNO NAJBOLJE RESENJE")
    printParticle(globalBestParticle)
end