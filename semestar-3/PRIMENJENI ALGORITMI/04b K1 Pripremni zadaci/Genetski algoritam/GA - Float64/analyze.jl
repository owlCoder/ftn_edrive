include("geneticAlgorithm.jl")

function calculateAverage(data, elitePercentage, crossoverPoint, mutationPercentage, num)
    averageGen = 0.0
    averageFit = 0.0

    for i in 1:num
        gen, pop = geneticAlgorithm!(data, elitePercentage, crossoverPoint, mutationPercentage)
        averageGen += gen
        averageFit += pop[1].fitness
    end

    averageGen /= num
    averageFit /= num

    return averageGen, averageFit
end

function findBestCrossover(data, elitePercentage, crossoverRange, mutationPercentage, num)
    resultsGen = ones(length(crossoverRange), 1)
    resultsFit = ones(length(crossoverRange), 1)

    for i in 1:length(crossoverRange)
        crossoverPoint = crossoverRange[i]

        gen, pop = calculateAverage(data, elitePercentage, crossoverPoint, mutationPercentage, num)
        resultsGen[i] = gen
        resultsFit[i] = pop
    end
    minIndex = argmin(resultsGen)
    optimalValue = resultsFit[minIndex[1]]

    return crossoverRange[minIndex], optimalValue
end