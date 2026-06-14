include("population.jl")

function geneticAlgorithm!(data, fitValue, selectionSize, crossoverPoint, mutationPercentage, repeatSize)
    calculatePopulationFitness!(data, genesLength)
    popGen = 0
    bestFit = data[1].fitness
    repeatNum = 1

    while( (data[1].fitness > 0) && (repeatNum < repeatSize) )
        data = selectPopulation(data, selectionSize)
        data = crossoverPopulation!(data, crossoverPoint)
        mutatePopulation!(data, mutationPercentage)
        calculatePopulationFitness!(data, fitValue)
        popGen = popGen + 1

        println("Generacija $popGen bestFit $bestFit broj ponavljanja $repeatNum")

        if(bestFit == data[1].fitness)
            repeatNum = repeatNum + 1
        else
            bestFit = data[1].fitness
            repeatNum = 1
        end
    end
    return popGen, repeatNum, data
end