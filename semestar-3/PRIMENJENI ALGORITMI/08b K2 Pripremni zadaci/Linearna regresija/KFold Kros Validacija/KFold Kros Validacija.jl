#=
Neka je dat skup tačaka u ravni. Napisati skript kojim se određuje
zavisnost vrednosti y koordinate u zavisnosti od x koordinate tačke. Pri
tome:
– Testiranja izvršiti K-fold kros validacijom za k = 5
– Pronaći prosečnu absolutnu grešku za svako od 5 testiranja
– Pronaći prosečnu absolutnu grešku za tih 5 testiranja
=#
using StatsModels, GLM, DataFrames, CSV, Statistics, MLBase

# FAZA 1 - PRIPREMA I UCITAVANJE PODATAKA
data = DataFrame(CSV.File("tacke40c.csv"))
fm = @formula(y ~ x)

# PODESAVANJE KFOLD KROS VALIDACIJE
k = 5
a = collect(Kfold(length(data.x), k))
averageAbsMeanErrorTest = 0.0

for i in 1:k
    # PODELA NA SKUP ZA OBUKU I NA SKUP ZA TESTIRANJE
    dataTrain = data[a[i], :]
    dataTest = data[setdiff(1:end, a[i]), :]

    linearRegressor = lm(fm, dataTrain)
    dataPredictedTest = predict(linearRegressor, dataTest)

    # RACUNANJE GRESAKA SKUPA ZA OBUKU
    errorsTest = dataTest.y - dataPredictedTest
    absMeanErrorTest = mean(abs.(errorsTest))

    # RACUNANJE MSE I RMSE (Root Mean Square Error)
    println("PROSECNA APSOLUTNA GRESKA ZA TEST $i JE: $absMeanErrorTest")
    global averageAbsMeanErrorTest += absMeanErrorTest
end

averageAbsMeanErrorTest /= k
println("PROSECNA APSOLUTNA GRESKA ZA TEST SVA TESTIRANJA JE: $averageAbsMeanErrorTest")