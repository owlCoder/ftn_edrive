include("swarm.jl")

function PsoAlgorithm(swarm, targetValue, maxIteration, maxVelocity)
    globalBestParticle = swarm[1]
    globalBestParticle = calculateGlobalBestParticle(swarm, targetValue, globalBestParticle)
    for i in 1:maxIteration
        if globalBestParticle.currentValue == targetValue
            printSwarm(swarm)
            println("\nSOLUTION")
            printParticle(globalBestParticle)
            println("\nSolution found after $i iterations")
            return
        end
        updateSwarmVelocity!(swarm, globalBestParticle, maxVelocity)
        updateSwarmPosition!(swarm, targetValue)
        globalBestParticle = calculateGlobalBestParticle(swarm, targetValue, globalBestParticle)
    end
    printSwarm(swarm)
    println("\nGlobaly best solution: ")
    printParticle(globalBestParticle)
end

function calculateGlobalBestParticle(swarm, targetValue, globalBestParticle)
    for i in 1:length(swarm)
        if abs(swarm[i].currentValue - targetValue) < abs(globalBestParticle.currentValue - targetValue)
            globalBestParticle = swarm[i]
        end
    end
    return deepcopy(globalBestParticle)
end