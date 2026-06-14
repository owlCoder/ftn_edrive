using DataFrames
using CSV
using StatsBase
using StatsModels
using Statistics
using Plots, StatsPlots
using ROC
using GLM
using Lathe

data = DataFrame(CSV.File("riba.csv"))
display(describe(data))

# display(countmap(data[!, :Cena]))
select!(data, Not(:Cena))

# display(countmap(data[!, :Vrsta]))
data[ismissing.(data[!, :Vrsta]), :Vrsta] .= mode(skipmissing(data[!, :Vrsta]))
data[ismissing.(data[!, :Duzina]), :Duzina] .= mode(skipmissing(data[!, :Duzina]))

println("\n------------------------------------------------------------------------------------------------------\n")
display(describe(data))

plot = scatter(data.Vrsta, data.Tezina, title="TEZINA - VRSTA", xlabel="VRSTA", ylabel="TEZINA")
savefig(plot, "vrstaTezina.html")

plot = scatter(data.DuzinaVertikalna, data.Tezina, title="DUZINA VERTIKALNA - TEZINA", xlabel="DUZINA VERTIKALNA", ylabel="TEZINA")
savefig(plot, "duzinaVertikalnaTezina.html")

plot = scatter(data.DuzinaDijagonalna, data.Tezina, title="DUZINA DIJAGONALA - TEZINA", xlabel="DUZINA DIJAGONALA", ylabel="TEZINA")
savefig(plot, "duzinaDijagolanaTezina.html")

plot = scatter(data.Duzina, data.Tezina, title="DUZINA - TEZINA", xlabel="DUZINA", ylabel="TEZINA")
savefig(plot, "duzinaTezina.html")

plot = scatter(data.Sirina, data.Tezina, title="SIRINA - TEZINA", xlabel="SIRINA", ylabel="TEZINA")
savefig(plot, "duzinaVrstaTezina.html")

cpvDuzinaDijagonalnaVertikalna = cov(data.DuzinaDijagonalna, data.DuzinaVertikalna)
if cpvDuzinaDijagonalnaVertikalna > 0.6
    select!(data, Not(:DuzinaVertikalna))
end

covDuzinaDijagonalna = cov(data.DuzinaDijagonalna, data.Duzina)
if covDuzinaDijagonalna > 0.6
    select!(data, Not(:DuzinaDijagonalna))
end

filter!(row -> row.Tezina <= 1500, data)

fm = @formula(Tezina ~ Vrsta + Duzina + Visina + Sirina)
dfTrain, dfTest = Lathe.preprocess.TrainTestSplit(data, .75)
regressionModel = lm(fm, dfTrain)

predictTest = predict(regressionModel, dfTest)
predictTrain = predict(regressionModel, dfTrain)

errorsTest = dfTest.Tezina - predictTest
errorsTrain = dfTrain.Tezina - predictTrain

rmseTest = sqrt(mean(errorsTest .* errorsTest))
rmseTrain = sqrt(mean(errorsTrain .* errorsTrain))

println("\nRMSE Test $rmseTest\nRMSE Train $rmseTrain\n")
println(r2(regressionModel))

if r2(regressionModel) > 0.5
    println("IMAMO DOVOLJNO DOBAR MODEL ZA PREDVIDJANJE.")
end
