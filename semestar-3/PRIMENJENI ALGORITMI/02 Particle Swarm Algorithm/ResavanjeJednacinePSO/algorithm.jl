include("swarm.jl")

function converge(bestValues, targetValue)
    len = length(bestValues)

    if bestValues[len] == targetValue
        return true
    elseif len < 4
        return false
    elseif bestValues[len] > 0.1 || bestValues[len] < -0.1
        return false
    else
        return bestValues[len - 3] == bestValues[len]
    end
end

function PsoAlgorithm(swarm, targetValue, maxIteration, maxVelocity)
    globalBestParticle = swarm[1]
    globalBestParticle = calculateGlobalBestParticle(swarm, targetValue, globalBestParticle)
    bestValues = [globalBestParticle.currentValue]
    for i in 1:maxIteration
        if converge(bestValues, targetValue)
            printSwarm(swarm)
            println("\nSOLUTION")
            printParticle(globalBestParticle)
            println("\nSolution found after $i iterations")
            return
        end
        updateSwarmVelocity!(swarm, globalBestParticle, maxVelocity)
        updateSwarmPosition!(swarm, targetValue)
        globalBestParticle = calculateGlobalBestParticle(swarm, targetValue, globalBestParticle)
        bestValues = [bestValues; globalBestParticle.currentValue]
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
    return globalBestParticle
end