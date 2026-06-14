struct Takmičar
    ime::String
    prezime::String
    poeni::Int
end

takmičari = []
push!(takmičari, Takmičar("Stefan", "Zivkovic",  3))
push!(takmičari, Takmičar("Nenad", "Nikolic",   16))
push!(takmičari, Takmičar("Marko", "Markovic",  13))
push!(takmičari, Takmičar("Srdjan", "Knezevic",  5))
push!(takmičari, Takmičar("Vanja", "Tomilic", 17))
push!(takmičari, Takmičar("Nikola", "Tomic",     8))
push!(takmičari, Takmičar("Ivana", "Ivanovic",   2))
push!(takmičari, Takmičar("Vanja", "Tomic",  9))

using Printf

function ispisTakmičara(takmičari)
  for i in 1:length(takmičari)
     @printf("%2i. %-10s %-10s %3i\n", i, takmičari[i].ime, takmičari[i].prezime, takmičari[i].poeni)
  end
end
