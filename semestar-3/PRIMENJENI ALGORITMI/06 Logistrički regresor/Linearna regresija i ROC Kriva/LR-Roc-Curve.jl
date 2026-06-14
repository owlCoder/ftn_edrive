using StatsModels
using GLM
using DataFrames
using CSV
using Lathe.preprocess: TrainTestSplit
using Plots
using Statistics
using StatsBase
using MLBase
using ROC

csv = ["CSV/tacke100.csv", "CSV/tacke1000a.csv", "CSV/tacke1000b.csv", "CSV/tacke1000c.csv"]

# PRIPREMA PODATA - UČITAVANJE PODATAKA IZ CSV DATOTEKE
data = DataFrame(CSV.File(csv[rand(1:4)]))

# PODELA NA SKUP ZA OBUKU I SKUP ZA TESTIRANJE
dataTrain, dataTest = TrainTestSplit(data, .80)
plot = scatter(dataTrain.x, dataTrain.y, title = "TAČKE PRE LOGISTIČKE REGRESIJE")
scatter!(plot, dataTest.x, dataTest.y)

# LOGISTIČKA REGRESIJA - KORISTI SE SKUP ZA OBUKU
fm = @formula(boja ~ x + y)
logisticRegressor = glm(fm, dataTrain, Binomial(), ProbitLink())

# TESTIRANJE PODATAKA LOGISTIČKOM REGRESIJOM
dataPredictedTest = predict(logisticRegressor, dataTest)
println("PREDVIĐENI PODACI\n $(round.(dataPredictedTest; digits = 2))")

# RAČUNANJE MATRICE
dataPredictedTestClass = repeat(0:0, length(dataPredictedTest))
for i in 1:length(dataPredictedTest)
    if dataPredictedTest[i] < 0.5
        dataPredictedTestClass[i] = 0
    else
        dataPredictedTestClass[i] = 1
    end
end

println("\nPREDVIĐENE BOJE\n $dataPredictedTestClass")
println("\nBOJE\n $(dataTest.boja)")

FPTest = 0 # FALSE POSITIVES
FNTest = 0 # FALSE NEGATIVES
TPTest = 0 # TRUE POSITIVES
TNTest = 0 # TRUE NEGATIVES

# EKVIVALENT -->  confusion_matrix = MLBase.roc(dataTest.boja, dataPredictedTestClass)
for i in 1:length(dataPredictedTestClass)
    if data.boja[i] == 0 && dataPredictedTestClass[i] == 0
        global  TNTest += 1
    elseif data.boja[i] == 0 && dataPredictedTestClass[i] == 1
        global FPTest += 1
    elseif data.boja[i] == 1 && dataPredictedTestClass[i] == 0
        global FNTest += 1
    elseif data.boja[i] == 1 && dataPredictedTestClass[i] == 1
        global TPTest += 1
    end
end

# ACCURACY (PRECIZNOST) = (TP + TN) / (TP + TN + FP + FN) = (TP + TN)/(P + N)
accuracyTest = (TPTest + TNTest) / (TPTest + TNTest + FPTest + FNTest)

# SENSITIVITY (OSETLJIVOST, TP RATES) = TP / (TP + FN) = TP / P
sensitivityTest = TPTest / (TPTest + FNTest)

# SPECIFICITY (SPECIFIČNOST, TN RATES) = TN / (TN + FP) = TN / N
specificityTest = TNTest / (TNTest + FPTest)

println("\n\nTP = $TPTest, FP = $FPTest, TN = $TNTest, FN = $FNTest")
println("ACCURACY ZA TEST SKUP JE: $accuracyTest")
println("SENSITIVITY ZA TEST SKUP JE: $sensitivityTest")
println("SPECIFICITY ZA TEST SKUP JE: $specificityTest")

rocTest = ROC.roc(dataPredictedTest, dataTest.boja, true)
aucTest = AUC(rocTest)
println("POVRŠINA ISPOD KRIVE U PROCENTIMA JE: $aucTest %\n")

if aucTest > 0.9
    println("KLASIFIKATOR JE JAKO DOBAR.")
elseif aucTest > 0.8
    println("KLASIFIKATOR JE VEOMA DOBAR.")
elseif aucTest > 0.7
    println("KLASIFIKATOR JE DOSTA DOBAR.")
elseif aucTest > 0.5
    println("KLASIFIKATOR JE RELATIVNO DOBAR.")
else
    println("KLASIFIKATOR JE LOŠ.")
end
