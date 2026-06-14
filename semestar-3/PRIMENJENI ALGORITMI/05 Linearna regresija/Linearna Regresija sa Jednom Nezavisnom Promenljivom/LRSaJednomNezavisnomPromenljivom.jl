#=
Neka je dat skup tačaka u ravni. Napisati skript kojim se određuje
zavisnost vrednosti y koordinate u zavisnosti od x koordinate tačke. Pri
tome:
– Odrediti korelaciju između x i y koordinata
– Predvideti vrednosti y koordinata za test skup. Skupove podeliti u
odnosu 80:20
– Proceniti grešku za skup za obuku i test skup.
– Proveriti da li je model dobar za predvidjanja ovog tipa
– Proveriti da li je model overfitted
– Nacrtati ove skupove na grafikonu
=#
using StatsModels
using GLM
using DataFrames
using CSV
using Lathe.preprocess: TrainTestSplit
using Plots
using Statistics

# ULAZNI PODACI
fajl = ["tacke10.csv", "tacke40.csv", "tacke40a.csv", "tacke40b.csv", 
        "tacke40c.csv", "tacke40d.csv", "tacke40e.csv"]

idFajla = rand(1:length(fajl))
odabranaDatoteka = "CSV/" * fajl[idFajla]

# UCITAVANJE PODATAKA IZ CSV DATOTEKE
data = DataFrame(CSV.File(odabranaDatoteka))

println("ODABRANI FAJL: $(fajl[idFajla])")

# KOEFICIJENT KORELACIJE
c = cor(data.x, data.y)

if c > 0.9
        println("POSTOJI VEOMA JAKA VEZA IZMEDJU PODATAKA.")
elseif c > 0.7 
        println("POSTOJI JAKA VEZA IZMEDJU PODATAKA.")
elseif c > 0.5
        println("POSTOJI UMERENA VEZA IZMEDJU PODATAKA.")
else
        println("VEZA IZMEDJU PODATAKA NIJE DOVOLJNO JAKA.")
end

# PODELA NA SKUP ZA OBUKU I SKUP ZA TESTIRANJE
dataTrain, dataTest = TrainTestSplit(data, .80)

inputPlot = scatter(dataTrain.x, dataTrain.y, title = "TACKE PRE LINEARNE REGRESIJE", legend = :bottomright)
scatter!(inputPlot, dataTest.x, dataTest.y, legend = false)

# LINEARNA REGRESIJA - FAZA PRIPREME ZA LR SA SKUPOM ZA OBUKU
fm = @formula(y ~ x)
linearRegressor = lm(fm, dataTrain)

# TESTIRANJE PODATAKA LINEARNOM 
dataPredictedTrain = predict(linearRegressor, dataTrain)
dataPredictedTest  = predict(linearRegressor, dataTest)

# ISPIS PODATAKA SA TESTIRANJA
println("\n---------------- ISPIS PODATAKA SA TESTIRANJA ---------------")
for i in 1:length(dataPredictedTest)
        println("(X$i, Y$i) = ($(dataTest.x[i]), $(dataTest.y[i]))\t\tPredicted: Y$i $(dataPredictedTest[i])")
end

# GRAFIKON PODATAKA SA TESTIRANJA
outputPlot = scatter(dataTrain.x, dataTrain.y, title = "TACKE POSLE LINEARNE REGRESIJE", legend = :bottomright)
scatter!(outputPlot, dataTest.x, dataTest.y)
scatter!(outputPlot, dataTest.x, dataPredictedTest)
scatter(outputPlot)

# ANALIZA REZULTATA - RACUNA SE VREDNOST R2 (R SQUARED)
println("\n----- ANALIZA REZULTATA - RACUNA SE VREDNOST R2 (R SQUARED) -----")
rSquared = r2(linearRegressor)
println("VREDNOST R SQUARED IZNOSI $rSquared")

if rSquared > 0.9
        println("OVAJ MODEL JE JAKO DOBAR ZA PREDVIDJANJE.")
elseif rSquared > 0.7
        println("OVAJ MODEL JE VEOMA DOBAR ZA PREDVIDJANJE.")
elseif rSquared > 0.5
        println("OVAJ MODEL JE RELATIVNO DOBAR ZA PREDVIDJANJE.")
else
        println("OVAJ MODEL NIJE DOBAR ZA PREDVIDJANJE.")
end

# RACUNANJE GRESAKA SKUPA ZA OBUKU - RACUNA SE GRESKA PONAOSOB ZA SVAKU VREDNOST
errorsTrain = dataTrain.y - dataPredictedTrain
println("\nSPISAK GRESAKA PRI OBUCI JE: $(round.(errorsTrain; digits = 3))") 

# RACUNANJE PROSEKA GRESKE
absMeanErrorTrain = mean(abs.(errorsTrain))

# RACUNANJE PROSECNE RELATIVNE GRESKE U PROCENTIMA MAPE
mapeTrain = mean(abs.(errorsTrain ./ dataTrain.y))

# RACUNANJE KVADRATA GRESAKA ZA SVAKU VREDNOST POSEBNO
errorTrainSquared = errorsTrain .* errorsTrain

# RACUNANJE MSE I RMSE - Root Mean Square Error
mseTrain = mean(errorTrainSquared)
rmseTrain = sqrt(mean(errorTrainSquared))

println("\nPROSECNA APSOLUTNA GRESKA PRI OBUCI JE: $absMeanErrorTrain")
println("PROSECNA RELATIVNA GRESKA PRI OBUCI JE: $mapeTrain")
println("PROSEK KVADRATA GRESKE PRI OBUCI JE: $mseTrain")
println("KOREN PROSEKA KVADRATA GRESKE PRI OBUCI JE: $rmseTrain")

# RACUNANJE GRESAKA ZA TEST SKUP - RACUNANJE GRESKE ZA SVAKU VREDNOST PONAOSOB
errorsTest = dataTest.y - dataPredictedTest
println("\nSPISAK SVIH GRESAKA PRI TESTIRANJU JE: $(round.(errorsTest, digits = 3))")

# RACUNANJE PROSEKA GRESKE
absMeanErrorTest = mean(abs.(errorsTest))

# RACUNANJE PROSECNE RELATIVNE GRESKE U PROCENTIMA MAPE
mapeTest = mean(abs.(errorsTest ./ dataTest.y))

# RACUNANJE KVADRATA GRESAKA ZA SVAKU VREDNOST PONAOSOB
errorTestSquared = errorsTest .* errorsTest

# RACUNANJE MSE I RMSE (Root Mean Square Error)
mseTest = mean(errorTestSquared)
rmseTest = sqrt(mean(errorTestSquared))

println("\nPROSECNA APSOLUTNA GRESKA PRI TESTIRANJU JE: $absMeanErrorTest")
println("PROSECNA RELATIVNA GRESKA PRI TESTIRANJU JE: $mapeTest")
println("PROSEK KVADRATA GRESKE PRI TESTIRANJU JE: $mseTest")
println("KOREN PROSEKA KVADRATA GRESKE PRI TESTIRANJU JE: $rmseTest")

if rmseTrain < rmseTest
        println("\nSISTEM JE DOBRO ISTRENIRAN.")
else
        println("\nSISTEM NIJE DOBRO ISTRENIRAN.")
end
