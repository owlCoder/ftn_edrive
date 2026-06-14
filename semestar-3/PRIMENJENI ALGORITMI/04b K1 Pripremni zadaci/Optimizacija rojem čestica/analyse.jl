include("pso.jl")

function calculateAverage(swarm, targetValue, maxIteration, maxVelocity, X, num)
    averageBestValue = 0.0

    for i in 1:num
        avgBV = PsoAlgorithm!(swarm, targetValue, maxIteration, maxVelocity, X)
        averageBestValue += avgBV
    end
    averageBestValue /= num
    return averageBestValue
end


function findBestMaxVelocity(swarm, targetValue, maxIteration, maxVelocityRange, X, num)
    nizProseka = []
    for i in 1:num
        maxVelocity = maxVelocityRange[i]
        avgBV = calculateAverage(swarm, targetValue, maxIteration, maxVelocity, X, num)
        push!(nizProseka, avgBV)
    end
    minIdxProseka = argmin(nizProseka)[1]
    return maxVelocityRange[minIdxProseka]
end
