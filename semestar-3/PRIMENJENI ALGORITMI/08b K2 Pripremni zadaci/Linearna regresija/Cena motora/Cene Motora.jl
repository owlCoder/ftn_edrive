using Statistics
using StatsModels
using StatsBase
using GLM
using DataFrames
using CSV
using Lathe
using Plots, StatsPlots

plotlyjs()

data = DataFrame(CSV.File("CSV/motor_cena.csv"))

# STATISTIČKI PODACI O SETU PODATAKA
display(describe(data))

# BOJE
println("\n------------------------------ BOJE ------------------------------")
display(countmap(data[!, :Boja]))

# TIP
println("\n------------------------------ TIP ------------------------------")
display(countmap(data[!, :Tip]))

# OŠTEĆENJE
println("\n--------------------------- OŠTEĆENJE ---------------------------")
display(countmap(data[!, :Ostecenje]))

# STANJE
println("\n---------------------------- STANJE -----------------------------")
display(countmap(data[!, :Stanje]))

# IZBACUJEMO KOLONU BOJA JER VIŠE OD 60% VREDNOSTI NE POSTOJI I SAMO
# BI NAŠ MODEL ZBUNILO
select!(data, Not(:Boja))

# MANJE OD 40% VREDNOSTI CENI FALI TE ĆEMO TE REDOVI I UKLONI IZ DATA SETA
dropmissing!(data, [:Cena])

# TAKOĐE IZBACUJEMO SVE REDOVE GDE JE CENA 0
filter!(row -> row.Cena != 0, data)

# AKO JE BROJ PODATAKA KOJI NEDOSTAJU SA MALIM UDELOM, ONDA TE PODATKE MOŽEMO
# ZAMENITI STANJEM KOJE SE NAJČEŠĆE POJAVLJUJE U DATA SETU
data[ismissing.(data[!, :Stanje]), :Stanje] .= mode(skipmissing(data[!, :Stanje]))

# TAKOĐE, SLIČNO I ZA OŠTEĆENJE
data[ismissing.(data[!, :Ostecenje]), :Ostecenje] .= mode(skipmissing(data[!, :Ostecenje]))

# ZA NUMERIČKE KOLONE KOJE IMAJU MALO VREDNOSTI PODATAKA KOJIH FALI
# MOŽEMO IH POPUNITI PROSEKOM OSTALIH VREDNSOTI
data[ismissing.(data[!, :Kilometraza]), :Kilometraza] .= trunc(Int64, mean(skipmissing(data[!, :Kilometraza])))

# STATISTIČKI PODACI O SETU PODATAKA NAKON KOREKCIJA
println("\n----------------------------------------------- NAKON KOREKCIJA ---------------------------------------------")
display(describe(data))

# CRTANJE PLOTOVA ZA SVAKU PROMENLJIVU KAKO BI KORIGOVALI PODATKE
# KOJI ODSKAČU OD OSTALIH
godiste = scatter(data.Godiste, data.Cena, title = "SCATTER GODISTE - CENA", xlabel = "GODISTE", ylabel = "CENA")
display(godiste)
savefig(godiste, "godišteScatter.html")

kilometraza = scatter(data.Kilometraza, data.Cena, title = "SCATTER KILOMETRAZA - CENA", xlabel = "KILOMETRAZA", ylabel = "CENA")
display(kilometraza)
savefig(kilometraza, "kilometražaScatter.html")

kw = scatter(data.kW, data.Cena, title = "SCATTER KW - CENA", xlabel = "KW", ylabel = "CENA")
display(kw)
savefig(kw, "kWScatter.html")

ks = scatter(data.KS, data.Cena, title = "SCATTER KS - CENA", xlabel = "KS", ylabel = "CENA")
display(ks)
savefig(ks, "KSScatter.html")

brojCilindara = scatter(data.BrojCilindara, data.Cena, title = "SCATTER BR. CILINDARA - CENA", xlabel = "BR. CILINDARA", ylabel = "CENA")
display(brojCilindara)
savefig(brojCilindara, "BRCilindaraScatter.html")

# PONOVNO FILTRIRANJE PODATAKA
filter!(row -> row.Godiste <= 2021 && row.Godiste > 1900, data)
filter!(row -> row.Kilometraza <= 500000, data)
filter!(row -> row.BrojCilindara > 0 && row.BrojCilindara < 300, data)

# AKO POGLEDAMO GRAFIKE ZA KS I KW VIDIMO DA SU SLIČNI ŠTO NAM UKAZUJE NA POTENCIJALNU
# MULTIKOLINEARNOST 
covKwKs = cov(data.kW, data.KS)

# UKOLIKO DETEKTUJEMO MULTIKOLINEARNOST - IZBACUJEMO JEDNU OD PROMENLJIVIH IZ MODELA
if covKwKs > 0.6
    select!(data, Not(:kW))
end

# PODACI SU SREĐENI - TE IH MOŽEMO POČETI SA TRENIRANJE MODELA
fm = @formula(Cena ~ Stanje + Tip + Godiste + Kilometraza + Kubikaza + KS + BrojCilindara + Ostecenje)
dataTrain, dataTest = Lathe.preprocess.TrainTestSplit(data, .75)

regressionModel = lm(fm, dataTrain)
predictedTest = predict(regressionModel, dataTest)
predictedTrain = predict(regressionModel, dataTrain)

errorsTest = dataTest.Cena - predictedTest
errorsTrain = dataTrain.Cena - predictedTrain

rmseTest = sqrt(mean(errorsTest .* errorsTest))
rmseTrain = sqrt(mean(errorsTrain .* errorsTrain))

println("\nRMSE TRENING SKUPA JE: $rmseTrain")
println("RMSE TEST SKUPA JE: $rmseTest")

println(r2(regressionModel))
if r2(regressionModel) > 0.5
    println("\nMODEL ZA PREDVIĐANJE JE DOVOLJNO DOBAR.")
end
