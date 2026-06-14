using StatsModels
using GLM
using DataFrames
using CSV
using Statistics
using MLBase

# UČITAVANJE PODATAKA
data = DataFrame(CSV.File("CSV/tacke40c.csv"))
fm = @formula(y ~ x)

# KFOLD KROS VALIDACIJA
k = 5
a = collect(Kfold(length(data.x), k))
averageAbsMeanErrorTest = 0.0

for i in 1:k
    # PODELA PODATAKA NA SKUP ZA OBUKU I TESTIRANJA; SKUP ZA PREDVIĐANJE
    dataTrain = data[a[i], :]
    dataTest = data[setdiff(1:end, a[i]), :]

    linearRegressor = lm(fm, dataTrain)
    dataPredictedTest = predict(linearRegressor, dataTest)

    # RAČUNANJE GREŠAKA SKUPA ZA OBUKU
    errorsTest = dataTest.y - dataPredictedTest
    absMeanErrorTest = mean(abs.(errorsTest))

    # RAČUNANJE MSE I RMSE - Root Mean Square Error
    println("PROSEČNA APSOLUTNA GREŠKA ZA TEST $i JE: $absMeanErrorTest")
    global averageAbsMeanErrorTest += absMeanErrorTest
end

averageAbsMeanErrorTest /= k
println("PROSEČNA APSOLUTNA GREŠKA ZA SVA TESTIRANJA JE: $averageAbsMeanErrorTest")