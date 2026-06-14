#=
Zadatak: Problem ranca
– Neka je dat ranac koji može da ponese kamenje u ukupnoj težini C. Neka je dato
N kamenja, od čega svaki kamen ima svoju težinu ti i svoju vrednost vi. Koje
kamenje treba zabrati, tako da njihova ukupna težina ne predje težinu C, a da im
ukupna vrednost bude što veća?
– Pri kreiranu algoritma, koristiti ukrtanje sa sve tačke ukrštanja. Ukrštati najbolje
jedinke po parovima
■ Zadatak za samostalan rad:
– Analizirati ponašanje sistema za vrednosti vrednost mutacije u rasponu 10-25%
– Analizirati ponašanje sistema za različite vrednosti tačaka ukršanja u rasponu
1-20
■ Analiza zadatka:
– Svaki kamen može da bude deo rešenja (vrednost 1) ili ne bude (vrednost 0), pa
dobijamo hromozom dužine N
– Za fitness vrednost možemo uzeti, razliku ukupne vrednosti svih kamenja i
vrednosti izabranog kamenja, tj. vrednost kamenja koje nismo izabrali i tu
vrednost treba minimizirati
=#

include("geneticAlgorithm.jl")

numberOfRocks = 20
values = rand(1:100, numberOfRocks)
weights = rand(1:10, numberOfRocks)
maxCapacity = 30
populationSize = 50
crossoverPoint1 = 7
crossoverPoint2 = 14
mutationPercentage = 0.1
elitePercentage = 0.1

population = generatePopulation(populationSize, numberOfRocks)
popGen, population = geneticAlgorithm!(population, elitePercentage, crossoverPoint1, crossoverPoint2,
        mutationPercentage, values, weights, maxCapacity)
# printPopulation(population)

sumWeights = sum(weights[population[1].genes .== 1])
out = ""

out *= "\nUkupan broj kamenja je $numberOfRocks"
out *= "\nTezine kamenja su $values"
out *= "\nMaksimalna tezina kamenja je $maxCapacity"
out *= "\nRezultati: "

if sumWeights > maxCapacity
    println("Nije pronadjeno resenje")
else
    global out *= "Tezina izabranog kamenja je: $sumWeights"
    value = sum(values[population[1].genes .== 1])
    global out *= "\nVrednost izabranog kamenja je: $value"
    global out *= "\nUkupan broj generacija je $popGen"
    global out *= "\nIdealna jedinka $(population[1])"
    global out *= "\nIzabrana su kamenja sa rednim brojevima: "
    for i in 1:numberOfRocks
        if population[1].genes[i] == 1
            global out *= "$i "
        end
    end

    println(out);
end