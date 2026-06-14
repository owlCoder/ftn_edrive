include("geneticAlgorithm.jl")

function calculateAverage(data, elitePercentage, crossoverPoint, mutationPercentage, num)
     averageGen = 0.0
     averageFit = 0.0
     for i in 1:num
         gen, pop = geneticAlgorithm!(data, elitePercentage, crossoverPoint, mutationPercentage)
	 averageGen += gen
	 averageFit += pop[1].fitness
     end
     averageGen = averageGen / num
     averageFit = averageFit / num
     return averageGen, averageFit
end

function findBestElitePercentage(data, eliteRange, crossoverPoint, mutationPercentage, num)
    resultsFit = []
    resultsGen = []
    for elitePercentage in eliteRange
        dataCopy = deepcopy(data)
        averageGen, averageFit = calculateAverage(dataCopy, elitePercentage, crossoverPoint, 
	                                          mutationPercentage, num)
	push!(resultsFit, averageFit)
        push!(resultsGen, averageGen)
    end
    minIndex = argmin(resultsFit)
    optimalValue = resultsFit[minIndex]
    return minIndex, optimalValue, resultsFit, resultsGen
end

function findBestCrossoverAndMutation(data, elitePercentage, crossoverRange, mutationRange, num)
    resultsFit = ones(length(crossoverRange), length(mutationRange))
    resultsGen = ones(length(crossoverRange), length(mutationRange))
    for i in 1:length(crossoverRange)
        crossoverPoint = crossoverRange[i]
	for j in 1:length(mutationRange)
	    mutationPoint = mutationRange[j]
	    dataCopy = deepcopy(data)
	    averageGen, averageFit = calculateAverage(dataCopy, elitePercentage, crossoverPoint, 
	                                          mutationPercentage, num)
            resultsFit[i, j] = averageFit;
            resultsGen[i, j] = averageGen;
	end
    end
    coordinates = argmin(resultsFit)
    minCrossoverIndex = coordinates[1]
    minMutationIndex = coordinates[2]
    optimalValue = resultsFit[minCrossoverIndex, minMutationIndex]
    return minCrossoverIndex, minCrossoverIndex, optimalValue, resultsFit, resultsGen
end
