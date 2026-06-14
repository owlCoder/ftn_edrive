# Zadatak 7: Za podatke iz tabele T (Primer 4 - Složeni primeri) napisati kod koji određuje:
#    - koliko je ženskih, a koliko muških osoba (poželjno je prikazati i njihova imena),
#    - prosečnu visinu i težinu ženskih osoba,
#    - prosečnu visinu i težinu muških osoba,
#    - najstariju i najmlađu osobu,
#    - standardnu devijaciju za visinu.

############### TABELA ################
# Ime   Pol Starost Težina Visina
# Ana     ž 20      46     160
# Bojan   m 24      52     165
# Vlada   m 24      95     195
# Gordana ž 30      57     160
# Dejan   m 36      84     185
# Zoran   m 22      80     180

using LinearAlgebra
using Statistics

T = ["Ime"    "Pol" "Starost" "Tezina" "Visina";
     "Ana"     "z"        20       46      160;
     "Bojan"   "m"        24       52      165;
     "Vlada"   "m"        24       95      195;
     "Gordana" "z"        30       57      160;
     "Dejan"   "m"        36       84      185;
     "Zoran"   "m"        22       80      180]

# koliko je ženskih, a koliko muških osoba (poželjno je prikazati i njihova imena)
izdvojeniPodaci  = T[:, 2]
zenskihOsoba = findall(izdvojeniPodaci .== "z")
muskihOsoba  = findall(izdvojeniPodaci .== "m")

println("Zenskih osoba: ",  length(zenskihOsoba), "\nMuskih  osoba: ",  length(muskihOsoba))
println("\nZenske osobe -> ", T[zenskihOsoba, 1])
println("Muske  osobe -> ", T[muskihOsoba, 1])

# prosečnu visinu i težinu ženskih osoba
avgVisinaZene = mean(T[zenskihOsoba, 5])
avgTezinaZene = mean(T[zenskihOsoba, 4])

println("\nProsecna visina zenskih osoba: ", avgVisinaZene, " cm")
println("Prosecna tezina zenskih osoba: ", avgTezinaZene, " kg")

# prosečnu visinu i težinu muških osoba
avgVisinaMuskarci = mean(T[muskihOsoba, 5])
avgTezinaMuskarci = mean(T[muskihOsoba, 4])

println("\nProsecna visina muskih osoba: ", avgVisinaMuskarci, " cm")
println("Prosecna tezina muskih osoba: ", avgTezinaMuskarci, " kg")

# najstariju i najmlađu osobu
starosti = T[2:end, 3]
najmladja  = minimum(starosti)
najstarija = maximum(starosti)

println("\nNajmladja osoba  ima: ", najmladja, " god\nNajstarija osoba ima: ", najstarija, " god")

# standardnu devijaciju za visinu
devijacija = 0.042 * (starosti .- 21) - 0.0015 * (starosti .- 21).^2

println("\nDevijacija visine: ", round.(mean(devijacija) * 100), "%")