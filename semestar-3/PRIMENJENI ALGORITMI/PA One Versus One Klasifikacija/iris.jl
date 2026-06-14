# PR55-2020 Danijel Jovanović
using Random
using DataFrames
using CSV
using GLM

function loadCSV(filename)
    return DataFrame(CSV.File(filename))
end

function Replicator(data, value, numValue)
    for i in 1:size(data)[1]
        if data[i, :variety] == value
            data[i, :Variety] = numValue
        end
    end
end

function TrainTestSplit(data, percentage)
    len = size(data)[1]
    trainLen = trunc(Int64, len * percentage) + rand(1:10) - rand(1:10)

    indxTrain = []
    rndArr = collect(1:len)

    for i in 1:trainLen
        rndIdx = rand(rndArr)
        push!(indxTrain, rndIdx)
        deleteat!(rndArr, findall(x -> x == rndIdx, rndArr))
    end

    dataTrain = data[indxTrain, :]
    dataTest  = data[rndArr, :]
    
    return dataTrain, dataTest
end

function preparation(filename)
    data = loadCSV(filename)

    insertcols!(data, 5, :Variety => 0.0, makeunique = false)
    Replicator(data, "Setosa",     1)
    Replicator(data, "Versicolor", 2)
    Replicator(data, "Virginica",  3)

    data = select!(data, Not(:variety))
    dataTrain, dataTest = TrainTestSplit(data, .70)

    return data, dataTrain, dataTest
end

function separation(data, toExclude, fst, snd)
    newData = filter!(row -> row.Variety != toExclude, deepcopy(data))

    for i in 1:size(newData)[1]
        if newData[i, :Variety] == fst
            newData[i, :Variety] = 1.0
        elseif newData[i, :Variety] == snd
            newData[i, :Variety] = 0.0
        end
    end

    return newData
end

function regressors(fm, DTSetosaVersicolor, DTSetosaVirginica, DTVersicolorVirginica)
    LR_SEVE = glm(fm, DTSetosaVersicolor,    Binomial(), LogitLink())
    LR_SEVI = glm(fm, DTSetosaVirginica,     Binomial(), LogitLink())
    LR_VEVI = glm(fm, DTVersicolorVirginica, Binomial(), LogitLink())

    return LR_SEVE, LR_SEVI, LR_VEVI
end

function predict_iris(LR_SEVE, LR_SEVI, LR_VEVI, dataTest)
    DP_SEVE = predict(LR_SEVE, dataTest)
    DP_SEVI = predict(LR_SEVI, dataTest)
    DP_VEVI = predict(LR_VEVI, dataTest)

    return DP_SEVE, DP_SEVI, DP_VEVI
end

function OneVsOneClassfier(DP_SEVE, DP_SEVI, DP_VEVI, dataTest)
    dataPredictedTestClass = repeat(0:0, size(dataTest)[1])
    scores = [0, 0, 0] 

    for i in 1:length(dataPredictedTestClass)
        

        # Setosa vs Versicolor
        if DP_SEVE[i] < 0.5
            scores[1] += 1
        else 
            scores[2] += 1
        end
        
        # Setosa vs Virginica
        if DP_SEVI[i] < 0.5
            scores[1] += 1
        else 
            scores[3] += 1
        end

        # Versicolor vs Virginica
        if DP_VEVI[i] < 0.5
            scores[2] += 1
        else 
            scores[3] += 1
        end

        # "POBEDJUJE" KLASA SA NAJVECIM SKOROM
        dataPredictedTestClass[i] = argmax(scores)
    end
    return dataPredictedTestClass
end

function confusionMatrix(data, dataPredictedTestClass)
    FPTest = 0 # FALSE POSITIVES
    FNTest = 0 # FALSE NEGATIVES
    TPTest = 0 # TRUE POSITIVES
    TNTest = 0 # TRUE NEGATIVES

    for i in 1:length(dataPredictedTestClass)
        if     dataPredictedTestClass[i] ==      data[i]      TPTest += 1
        elseif dataPredictedTestClass[i] == 1 && data[i] != 1 FPTest += 1
        elseif dataPredictedTestClass[i] != 1 && data[i] == 1 FNTest += 1
        elseif dataPredictedTestClass[i] == 2 && data[i] != 2 FPTest += 1
        elseif dataPredictedTestClass[i] != 2 && data[i] == 2 FNTest += 1
        elseif dataPredictedTestClass[i] == 3 && data[i] != 3 FPTest += 1
        elseif dataPredictedTestClass[i] != 3 && data[i] == 3 FNTest += 1
        else
            TNTest += 1
        end
    end
    return FPTest, FNTest, TPTest, TNTest
end

function calculateAccuracySensitivity(FPTest, FNTest, TPTest, TNTest)
    # ACCURACY (PRECIZNOST) = (TP + TN) / (TP + TN + FP + FN) = (TP + TN)/(P + N)
    accuracyTest = (TPTest + TNTest) / (TPTest + TNTest + FPTest + FNTest)

    # SENSITIVITY (OSETLJIVOST, TP RATES) = TP / (TP + FN) = TP / P
    sensitivityTest = TPTest / (TPTest + FNTest)

    return accuracyTest, sensitivityTest
end

data, dataTrain, dataTest = preparation("iris.csv")

println("-----------------------------------------")
print("\t\tPODACI")
println("\n-----------------------------------------")
println("TRAIN SET BROJ PODATAKA: { $(length(dataTrain.petalLength)) podataka }")
println("TEST  SET BROJ PODATAKA: { $(length(dataTest.petalLength))  podataka }")
println("-----------------------------------------")
println("UKUPAN    BROJ PODATAKA: { $(length(data.petalLength)) podataka }")
# oVo => n * (n - 1) / 2 [n = 3; 3 * (3 - 1) / 2 => 6 / 2 = 3]
# "Setosa",     1
# "Versicolor", 2
# "Virginica",  3

DTSetosaVersicolor    = separation(dataTrain, 3, 1, 2)   # IZBACUJE SE KLASA KOJA SE NE POREDI
DTSetosaVirginica     = separation(dataTrain, 2, 1, 3)   # IZBACUJE SE KLASA KOJA SE NE POREDI
DTVersicolorVirginica = separation(dataTrain, 1, 2, 3)   # IZBACUJE SE KLASA KOJA SE NE POREDI

# FORMULA
fm = @formula(Variety  ~ sepalLength + sepalWidth + petalLength + petalWidth)

# LOGISTIČKI REGRESORI ZA OBUKU
LR_SEVE, LR_SEVI, LR_VEVI      = regressors(fm, DTSetosaVersicolor, DTSetosaVirginica, DTVersicolorVirginica)

# PREDVIĐEN VARIJITET
DP_SEVE, DP_SEVI, DP_VEVI      = predict_iris(LR_SEVE, LR_SEVI, LR_VEVI, dataTest)

# OneVsOneClassfier()
dataPredictedTestClass  = OneVsOneClassfier(DP_SEVE, DP_SEVI, DP_VEVI, dataTest)

# CONFUSFION MATRIX
FPTest, FNTest, TPTest, TNTest = confusionMatrix(dataTest.Variety, dataPredictedTestClass)

# PRECIZNOST I OSETLJIVOST
accuracyTest, sensitivityTest  = calculateAccuracySensitivity(FPTest, FNTest, TPTest, TNTest)

# ANALIZA
println("-----------------------------------------")
print("\t\tANALIZA")
println("\n-----------------------------------------")
println("\t\tTP = $TPTest\n\t\tFP = $FPTest\n\t\tTN = $TNTest\n\t\tFN = $FNTest")
println("-----------------------------------------")
println("ACCURACY    ZA TEST SKUP JE: $(round(accuracyTest, digits = 10))")
println("SENSITIVITY ZA TEST SKUP JE: $(round(sensitivityTest, digits = 10))")
