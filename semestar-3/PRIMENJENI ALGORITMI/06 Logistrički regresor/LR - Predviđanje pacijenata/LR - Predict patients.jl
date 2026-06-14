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

csv = ["CSV/pacijenti1000a.csv", "CSV/pacijenti1000b.csv", "CSV/pacijenti1000c.csv"]

# PRIPREMA PODATA - UČITAVANJE PODATAKA IZ CSV DATOTEKE
data = DataFrame(CSV.File(csv[rand(1:3)]))

# PODELA NA SKUP ZA OBUKU I SKUP ZA TESTIRANJE
dataTrain, dataTest = TrainTestSplit(data, .80)

# LOGISTIČKA REGRESIJA - KORISTI SE SKUP ZA OBUKU
fm = @formula(bolest ~ visina + tezina + dbp + sbp)
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

brojObolelihOdDijabetesaPredict = sum(dataPredictedTestClass)
brojZdravihPredict = length(dataPredictedTestClass) - brojObolelihOdDijabetesaPredict

brojObolelihOdDijabetesa = sum(dataTest.bolest)
brojZdravih = length(dataTest.bolest) - brojObolelihOdDijabetesa

println("\nPREDVIĐEN BROJ OSOBA KOJE IMAJU DIJABETES JE: $brojObolelihOdDijabetesaPredict")
println("\nBROJ OSOBA KOJE IMAJU DIJABETES JE: $brojObolelihOdDijabetesa")

println("\nPREDVIĐEN BROJ OSOBA KOJE NEMAJU DIJABETES JE: $brojZdravihPredict")
println("\nBROJ OSOBA KOJE NEMAJU DIJABETES JE: $brojZdravih")