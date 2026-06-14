#=
Neka je data baza automobila, pri čemu je za svaki automobil dat njegov
proizvođač, model, zapremina motora (kubikaža) i godište proizvodnje.
– Napraviti model linearne regresije za ovaj problem, a predviđanja cene izvršiti
na osnovu modela, kubikaže i godišta automobila
– Polje model enkodirati u više kolona u zavisnosti od vrednosti u toj koloni
– Izračunati greške predviđanja, kao i prosečnu absolutnu grešku i prosečnu
relativnu grešku
=#
using Statistics
using StatsModels
using GLM
using DataFrames
using CSV
using Lathe

# UCITAVANJE PODATAKA IZ CSV DATOTEKE
data = DataFrame(CSV.File("automobili.csv"))

# ONE HOT ENCODER 
# One hod encoding predstavlja mogućnost u preprocesiranju da se jedna 
# kolona koja ima N razlicitih vrednosti zameni sa N kolona, u kojima 
# će biti vrednosti Tačno i Netačno, u zavisnosti od vrednosti početne 
# kolone
encoder = Lathe.preprocess.OneHotEncoder()
data = encoder.predict(data, :model)

# PODELA PODATAKA NA TESTNI I TRAIN SKUP
dataTrain, dataTest = Lathe.preprocess.TrainTestSplit(data, .80)

# LINEARNA REGRESIJA
fm = @formula(cena ~ kubikaza + godiste + model)
linearRegressor = lm(fm, dataTrain)

predvidjenaCena = predict(linearRegressor, dataTest)
println("PROCENJENE CENE VOZILA: ")
for i in 1:length(predvidjenaCena)
    println("X$i: $(dataTest.proizvodjac[i]) $(dataTest.model[i]) $(dataTest.kubikaza[i]) $(dataTest.godiste[i]) CENA: $(dataTest.cena[i]) PROCENA: $(predvidjenaCena[i])")
end

# PROCENA, RACUNANJE I ISPIS GRESKE
errorsTest = dataTest.cena - predvidjenaCena
println("\nSPISAK SVIH GRESAKA PRI TESTIRANJU JE: $(round.(abs.(errorsTest); digits = 2))")

# RACUNANJE I ISPIS PROSEKA GRESKE
absMeanErrorTest = mean(abs.(errorsTest))
println("PROSECNA APSOLUTNA GRESKA PRI TESTIRANJU JE: $absMeanErrorTest evra.")

# RACUNANJE PROSECNE RELATIVNE GRESKE U PROCENTIMA MAPE
mapeTest = mean(abs.(errorsTest ./ dataTest.cena))
println("PROSECNA RELATIVNA GRESKA PRI TESTIRANJU JE: $(mapeTest * 100)%.")
