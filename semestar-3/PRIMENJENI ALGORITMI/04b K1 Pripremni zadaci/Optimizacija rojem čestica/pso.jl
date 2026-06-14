include("swarm.jl")

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

function PsoAlgorithm!(swarm, targetValue, maxIteration, maxVelocity, X)
    globalBestParticle = swarm[1]
    globalBestParticle = calculateGlobalBestParticle(swarm, targetValue, globalBestParticle)
    bestValues = [globalBestParticle.currentValue]

    for i in 1:maxIteration
        if converge(bestValues)
            return minimum(bestValues)
        end
        updateSwarmVelocity!(swarm, globalBestParticle, maxVelocity, X)
        updateSwarmPosition!(swarm, targetValue, X)
        globalBestParticle = calculateGlobalBestParticle(swarm, targetValue, globalBestParticle)
        bestValues = [bestValues; globalBestParticle.currentValue]
    end
    return globalBestParticle.currentValue
end